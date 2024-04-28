const cds = require("@sap/cds");

module.exports = function CityService() {

  this.before("CREATE", "Cities", (req) => {
    const validationCheck = this.validateData(req.data)
    if (!validationCheck.valid) {
      return req.reject(validationCheck.msg)
    }
  });

  this.after('READ', 'Cities', (cities, req) => {
		return cities.map(city => {
			if (city.population > 1000000) {
        city.criticality = 2
      }
		})
	})

  this.on('addCity', async (req) => {
    const cityService = await cds.connect.to('CityService')
    const { Cities } = cityService.entities
    const { name, population, area } = req.data.city;

    // Create a new city entity
    const newCity = {
      name: name,
      population: population,
      area: area
    };

    const validationCheck = this.validateData(newCity)
    if (!validationCheck.valid) {
      return req.reject(validationCheck.msg)
    }

    const response = await INSERT(newCity).into(Cities);
    return response
  })

  this.validateData = function (cityData) {
    if (!cityData.name) {
      return {valid: false, msg: "Name cannot be empty"}
    }
    if (cityData.population < 0) {
      return {valid: false, msg: "Population cannot be less than zero"}
    }
    if (cityData.area <= 0) {
      return {valid: false, msg: "Area cannot be less than or equal to zero"}
    }
    return {valid: true}
  }
}