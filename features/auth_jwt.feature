Feature: Post JWT auth endpoints

    As a tester
    I want to make sure that the JWT auth endpoints work as expected

    Scenario: Post employee to obtain JWT token
        Given I make a POST request to /api/v1/simulate/token
        # And I set body to
        #     """
        #     {
        #         "password": "admin",
        #         "username": "admin"
        #     }
        #     """
        And I set request body as admin details
        When I receive a response
        Then I assert response should have a status 200
        And I assert response should have a json schema
            """
            {
                "type": "object",
                "properties": {
                    "token": {
                        "type": "string"
                    }
                }
            }
            """
        And I create variable "userToken" from "token" response path

    Scenario: Get employees using authorization JWT
        Given I make a GET request to /api/v1/simulate/get/employees
        And I set header Authorization to Bearer $S{userToken}
        When I receive a response
        Then I assert response should have a status 200
