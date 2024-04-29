# Platform COE Hiring Challenge

It contains these folders and files, following the recommended CAP project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends 
`db/` | domain models and data 
`srv/` | service models and code 
`package.json` | project metadata and configuration
`readme.md` | this document


## Next Steps

- Clone the repo and run `npm i` to install the dependencies
- Open a new terminal and run `npm run start` to launch the backend server
- Open a new terminal and run `npm run watch-population-densities` to launch the server and the frontend
- The app uses CDS mock authentication with the following user profiles:
    - name: "user", password: "1234" - grants READ permissions for all records
    - name: "admin", password: "1234" - grants READ, WRITE permissions for all records
- The API is hosted at `http://localhost:4004/odata/v4/api/`
    - Return all cities: `http://localhost:4004/odata/v4/api/Cities`
    - Sort by name / population / area in descending or ascending manner: `http://localhost:4004/odata/v4/api/Cities?$orderby=<property> <order: asc/desc>` where property can be "name", "population" or "area" and order can be "asc" for ascending and "desc" for descending order respectively
    - Filter the cities by name using a “contains” filter: `http://localhost:4004/odata/v4/api/Cities?$filter=contains(name,'New')`
    - An endpoint to add new cities with name, population and area during runtime: `http://localhost:4004/odata/v4/api/addCity` with the parameters set in POST request data object like 
        ```
        {
            "city":{
                "name": "new city",
                "population": 1000000,
                "area": 2
            }
        }
- The UI loads the full dataset from the service and shows it in a table with all 4 columns. It also includes a calculated density column and highlights rows with population over 1 million
- The tests in `/tests/test.js` perform unit tests for all the specified functionality. You can run these tests by running `npm run test`
