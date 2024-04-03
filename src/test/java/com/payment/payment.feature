Feature: payment service contract test

Background:
* def accountid = 1234
* url paymentServiceUrl + '/payments' 

Scenario: create payment and get status
    Given path '/accounts/' + accountid
    And request { amount: 5.67, description: 'test one' }
    When method post
    Then status 200
    And match response == { id: '#string', amount: 5.67, description: 'test one', accountId: '#string' }
    And def id = response.id
 
    Given path '/' + id + '/payment_status'
    When method get
    Then status 200
    And match response == { id: '#(id)', amount: 5.67, description: 'test one', accountId: '#string' }

    
    
    
    
    

    
    
    

    
    
    

    
    
    
    