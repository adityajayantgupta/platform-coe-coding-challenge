using {sap.capire.cities as CityData} from '../db/schema';

service CityService @(path:'api') {
  @odata.draft.enabled
  entity Cities as projection on CityData.City;
}

extend projection CityService.Cities with{
  population/area as density: Decimal(10,2)
}

type City {
  name: String;
  population: Integer;
  area: Integer;
}