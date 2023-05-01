const { defineConfig } = require('cypress')

module.exports = defineConfig({
    projectId: "r6v848", 
    fixturesFolder: false,
  e2e: {
    baseUrl: 'https://www.stephaniechester.live/',
    setupNodeEvents(on, config) {},
    supportFile: false,
    specPattern: "/home/runner/work/Cloud_Resume_FrontEnd/Cloud_Resume_FrontEnd/cypress/e2e/*.{spec,cy}.js"
},
})   // The rest of the Cypress config options go here...