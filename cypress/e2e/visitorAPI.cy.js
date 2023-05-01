describe('visitorCount api', () => {
    context('POST /IncrementVisitorCount', () => {
        it('should return a visitor count', () => {
            cy.request({
                method: 'POST',
                url: 'https://7hn5blxzxg.execute-api.us-east-1.amazonaws.com/default/IncrementVisitorCounter'
            })
                .then((response) => {
                    cy.log(JSON.stringify(response.body))
                });
        });
    });
});
