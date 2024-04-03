Feature: payment gateway mock

Background:
    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
* def payments = {}

Scenario: pathMatches('/payments/accounts/{accountid}') && methodIs('post')
    * def payment = request
    * def id = uuid()
    * set payment.id = id
    * set payment.accountId = pathParams.accountid
    * payments[id + ''] = payment
    * def response = payment
    * def responseDelay = 1500



Scenario: pathMatches('/payments/{paymentid}/payment_status')
    * def response = payments[pathParams.paymentid]
    * def responseStatus = response ? 200 : 404
    * def responseDelay = 850

