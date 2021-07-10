Feature: Request API providers

  Background:
    * url 'https://controleestoque-backend.herokuapp.com/api/v1/'
    * def random_string =
      """
      function(s) {
        var text = "";
         var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
         for (var i = 0; i < s; i++)
         text += possible.charAt(Math.floor(Math.random() * possible.length));
      return text;
      }
      """


    Scenario: Register a provider
      * def sessionId =  random_string(10)
      * def payload_provider =
      """
      {
        "name": '#(sessionId)',
        "cnpj": "00000000006050"
      }
      """

      Given path 'providers'
      And request payload_provider
      When method post
      Then status 201
      And match response contains {'provider_id': '#notnull'}

    Scenario: Register a provider only mandatory filds
      * def sessionId =  random_string(10)
      * def only_fild_mandatory =
     """
      {
        "name": '#(sessionId)',
        "cnpj": ""
      }
      """
      Given path 'providers'
      And request only_fild_mandatory
      When method post
      Then status 201
      And match response contains {'provider_id': '#notnull'}

    Scenario: Registering a provider exceeding the name length
      * def sessionId =  random_string(71)
      * def payload_provider =
      """
      {
        "name": '#(sessionId)',
        "cnpj": "00000000006050"
      }
      """
      Given path 'providers'
      And request payload_provider
      When method post
      Then status 400
      And match response.message contains 'supplier field must have a maximum of 70 characters.'

    Scenario: Registering a provider when the name parameter is not entered
      * def payload_provider =
      """
      {
        "name": '',
        "cnpj": "00000000006050"
      }
      """
      Given path 'providers'
      And request payload_provider
      When method post
      Then status 400
      And match response.message contains 'provider field is mandatory'

    Scenario: Return all providers
      Given path 'providers'
      When method get
      Then status 200

