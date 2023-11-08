module.exports = {
  e2e: {
    baseUrl: 'http://hubble-ui.kube-system.svc',
    viewportWidth: 1280,
    viewportHeight: 720,
    defaultCommandTimeout: 7000,
    screenshotOnRunFailure: true,
    specPattern: '/cypress/spec.cy.js',
    supportFile: false,
  },
};
