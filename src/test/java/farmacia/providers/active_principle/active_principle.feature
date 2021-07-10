Feature: Resquet API active principle

  Background:
    * url 'https://controle-estoque-backend.herokuapp.com/api/v1'
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

    Scenario: Creating a active principle with sucess
      * def sessionId =  random_string(10)
      * def payload_active_principle =
      """
      {
        "name": '#(sessionId)'
      }
      """
      Given path 'active_principle'
      And request payload_active_principle
      When method post
      Then status 201
      And match response.s contains {'active_principle_id': '#notnull'}
