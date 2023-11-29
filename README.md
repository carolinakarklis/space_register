# SpaceRegister

A gem `SpaceRegister` se comunica diretamente com o [Centro de Comando Espacial](https://github.com/carolinakarklis/new_space_center) via API, criando veículos e viagens espaciais.


## Utilização

A classe `SpaceRegister` tem os seguintes métodos: `get_vehicle`, `get_vehicles`, `create_vehicle`, `update_vehicle`, `get_travels`, `create_travels`, `update_travel`, `fail_travel`, `abort_travel`, `start_travel`. 

Para visualizar um veículo específico, por exemplo:

**Input**

`SpaceRegister.get_vehicle(id: 2)`

**Output**
* Caso encontre o registro:
   ```#<struct SpaceCenterClient::Result success=true, data=#<OpenStruct name="Foguete", km_per_hour=200, travel_count=0>>```
* Caso não encontre: `#<struct SpaceCenterClient::Result success=false, data="Record not found">`

Os métodos do SpaceRegister sempre retornam uma struct de sucesso ou erro.

