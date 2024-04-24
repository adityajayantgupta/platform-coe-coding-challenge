using {sap.capire.cities as CityData} from '../db/schema';

service CityService @(path:'api'){

  entity Cities as projection on CityData.City;
  action addCity (city : City)                      returns String;
}

extend projection CityService.Cities with {
  population/area as density: Decimal(10,2),
}

  type City {
    name: String;
    population: Integer;
    area: Integer;
  }