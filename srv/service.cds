using {sap.capire.cities as CityData} from '../db/schema';

service CityService {
  
  @readonly
  entity Cities as projection on CityData.City;


}

extend projection CityService.Cities with {
  population/area as density: Decimal
}
