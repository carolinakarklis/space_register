require "space_register/version"
require "space_center_client"

module SpaceRegister
  def self.get_vehicle(params)
    SpaceCenterClient.new("http://localhost:3000/api/v1/space_vehicles/#{params[:id]}").get
  end

  def self.create_vehicle(params)
    params.fetch(:space_vehicle).fetch_values(:name, :km_per_hour, :agency_id)

    SpaceCenterClient.new("http://localhost:3000/api/v1/space_vehicles/", params).post
  end

  def self.update_vehicle(params)
    SpaceCenterClient.new("http://localhost:3000/api/v1/space_vehicles/#{params[:id]}", params).put
  end

  def self.get_vehicles
    SpaceCenterClient.new('http://localhost:3000/api/v1/space_vehicles/').get
  end

  def self.get_travels
    SpaceCenterClient.new('http://localhost:3000/api/v1/space_travels/').get
  end

  def self.create_travel(params)
    params.fetch(:space_travel).fetch_values(:start_at, :planet_id, :space_vehicle_id, :mission_description)

    SpaceCenterClient.new("http://localhost:3000/api/v1/space_travels/", params).post
  end

  def self.update_travel(params)
    SpaceCenterClient.new("http://localhost:3000/api/v1/space_travels/#{params[:id]}", params).put
  end

  def self.fail_travel(params)
    SpaceCenterClient.new("http://localhost:3000/api/v1/space_travels/#{params[:id]}/fail").post
  end

  def self.abort_travel(params)
    SpaceCenterClient.new("http://localhost:3000/api/v1/space_travels/#{params[:id]}/abort").post
  end

  def self.start_travel(params)
    SpaceCenterClient.new("http://localhost:3000/api/v1/space_travels/#{params[:id]}/start").post
  end
end
