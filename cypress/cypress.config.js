const { defineConfig } = require('cypress')

module.exports = defineConfig({
    projectId: "r6v848",
    fixturesFolder: false,
  e2e: {
    setupNodeEvents(on, config) {},
    supportFile: false,
    specPattern: './cypress/e2e/*.cy.{js,jsx,ts,tsx}'
},
})   // The rest of the Cypress config options go here...