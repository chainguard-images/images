// Define the test suite
describe('Hubble UI tests', () => {

  it('main page should show "kube-system"', () => {
    // Visit the app
    cy.visit('/');

    // Find the element that contains the word "kube-system"
    cy.get('body').contains('kube-system');

    // Verify that the element is visible
    cy.get('body').contains('kube-system').should('be.visible');
  });

  it('kube-system page should show "hubble-ui"', () => {
    // Visit the app
    cy.visit('/?namespace=kube-system');

    // Find the element that contains the word "hubble-ui"
    cy.get('body').contains('hubble-ui');

    // Verify that the element is visible
    cy.get('body').contains('hubble-ui').should('be.visible');
  });
});
