const cds = require('@sap/cds/lib')
const { default: axios } = require('axios')
const { GET, POST, expect } = cds.test(__dirname + '../../')

axios.defaults.auth = { username: 'user', password: '1234' }

jest.setTimeout(11111)

describe('City Service Tests - General User', () => {
  it('should check City Service', async () => {
    const cityService = await cds.connect.to('CityService')
    const { Cities } = cityService.entities
    // Assert that city data exists for the service
    expect(await SELECT.from(Cities)).length.to.be.greaterThan(0)
  })

  it('should return all cities', async () => {
    const { data } = await GET`/odata/v4/api/Cities`;
    // Assert that API response is an array and contains at least one city
    expect(data.value).to.be.an('array');
    expect(data.value).length.to.be.greaterThan(0);
  });

  it('should include density field in city data', async () => {
    const { data } = await GET`/odata/v4/api/Cities`;
    // Assert that each city object in data has a density field
    data.value.forEach(city => {
      expect(city.density).to.exist;
    });
  });

  it('should be able to sort cities by name, population, or area', async () => {
    const { data: sortedByName } = await GET`/odata/v4/api/Cities?$orderby=name asc`;
    const { data: sortedByPopulation } = await GET`/odata/v4/api/Cities?$orderby=population asc`;
    const { data: sortedByArea } = await GET`/odata/v4/api/Cities?$orderby=area asc`;
    // Assert that each sorting order is correct (ascending order)
    expect(isSortedAscending(sortedByName.value, 'name')).to.be.true;
    expect(isSortedAscending(sortedByPopulation.value, 'population')).to.be.true;
    expect(isSortedAscending(sortedByArea.value, 'area')).to.be.true;
  });

  function isSortedAscending(array, prop) {
    for (let i = 0; i < array.length - 1; i++) {
      if (array[i][prop] > array[i + 1][prop]) {
        return false;
      }
    }
    return true;
  }

  it('should be able to filter cities by name using "contains" filter', async () => {
    const { data: filteredCities } = await GET`/odata/v4/api/Cities?$filter=contains(name,'New')`;
    // Assert that the filtered cities contain the name 'New' in their names
    filteredCities.value.forEach(city => {
      expect(city.name.toLowerCase()).to.contain('new');
    });
  });


});

axios.defaults.auth = { username: 'admin', password: '1234' }

describe('City Service Tests - Admin User', () => {
  it('should be able to add new cities', async () => {
    const city = {
      name: 'New City',
      population: 1000000,
      area: 1000
    };
    const { status } = await POST(`/odata/v4/api/addCity`, {city});
    // Assert that the city is successfully added (200 OK by INSERT execution)
    expect(status).to.equal(200);
  });
})