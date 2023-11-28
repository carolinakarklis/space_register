require 'httparty'
require 'ostruct'

class SpaceCenterClient
  attr_reader :uri, :headers

  Result = Struct.new(:success, :data)

  def initialize(url, params={})
    @uri = URI(url)
    @headers = { 'Authorization' => 'Bearer bf49997d62ddce7413e193d93c7c6fe9'}
    @params = params
  end

  def get
    res = HTTParty.get(@uri, headers: @headers) 

    parse_response(res)
  end

  def post
    res = HTTParty.post(@uri, body: @params, headers: @headers) 

    parse_response(res)
  end

  def put
    res = HTTParty.put(@uri, body: @params, headers: @headers) 

    parse_response(res)
  end

  private

  def parse_response(res)
    body = JSON.parse(res.body)
  
    if res.code == 200
      return build_success_struct(body)
    else
      return build_error_struct(body)
    end
  end

  def build_success_struct(body)
    record = body["data"].is_a?(Array) ? body["data"].map { |item| OpenStruct.new(item["attributes"]) } : OpenStruct.new(body["data"]["attributes"])

    Result.new(true, record)
  end

  def build_error_struct(body)
    Result.new(false, body["message"])
  end
end
