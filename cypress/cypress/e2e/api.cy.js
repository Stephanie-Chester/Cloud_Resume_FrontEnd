describe('visitorCount API', () => {
    it('verify request returns JSON', () => {
      cy.request('https://7hn5blxzxg.execute-api.us-east-1.amazonaws.com/default/IncrementVisitorCounter').its('headers').its('content-type').should('include', 'application/json')
    })
  
    it('verify the request returns the correct status code', () => {
      cy.request('https://7hn5blxzxg.execute-api.us-east-1.amazonaws.com/default/IncrementVisitorCounter').its('status').should('be.equal', 200)
    })
  
    it('verify the request returns items', () => {
      cy.request('https://7hn5blxzxg.execute-api.us-east-1.amazonaws.com/default/IncrementVisitorCounter').its('body').should('have.length', 1)
    })
  })
  