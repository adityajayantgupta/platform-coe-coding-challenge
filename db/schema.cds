namespace sap.capire.cities;

entity City {
  key ID : UUID;
  name      : String(111);
  population: Integer;
  area      : Integer; // area in sq km
}
