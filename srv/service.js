const cds = require("@sap/cds");

module.exports = function CityService() {

  this.before("CREATE", "Cities", (req) => this.validateData(req));

  // filter out repeating cities 

  this.after('READ', 'Cities', (cities, req) => {

		return cities.map(async city => {
			if (city.population > 1000000) {
        city.criticality = 2
      }
		})

	})

  this.validateData = function (req) {
    const cityData = req.data
    if (!cityData.name) {
      return req.reject("Name cannot be empty")
    }

    if (cityData.population < 0) {
      return req.reject("Population cannot be less than zero")
    }
    if (cityData.area <= 0) {
      return req.reject("Area cannot be less than or equal to zero")
    }
  }
}