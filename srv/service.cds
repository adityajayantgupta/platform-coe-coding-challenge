using {sap.capire.cities as CityData} from '../db/schema';

service CityService @(path:'api') @(requires: 'authenticated-user'){
  @odata.draft.enabled
  entity Cities @(restrict: [
    { grant: 'WRITE', to: 'admin'},
    { grant: 'READ', to: ['user', 'admin']}
  ]) as projection on CityData.City;
  action addCity (city: City) returns String;
}

extend projection CityService.Cities with{
  population/area as density: Decimal(10,2)
}

type City {
  name: String;
  population: Integer;
  area: Integer;
}