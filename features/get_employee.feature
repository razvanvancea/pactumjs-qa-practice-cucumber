Feature: Get specific employee feature

    As a tester
    I want to make sure that GET /api/employees/id endpoint works as expected

    Scenario: Get specific employee with valid id
        Given I make a GET request to /api/v1/employees/1
        When I receive a response
        Then I assert response should have a status 200
        And I assert response should have a json
            """
            {
                "id": 1,
                "firstName": "Razvan",
                "lastName": "Smith",
                "dob": "1994-05-06",
                "email": "iamqarv@gmail.com"
            }
            """

    Scenario: Get specific employee with non existing id
        Given I make a GET request to /api/v1/employees/19199123123122
        When I receive a response
        Then I assert response should have a status 404
        And I assert response should have a body
            """
            Employee not found with ID 19199123123122
            """

    Scenario: Get specific employee with invalid id datatype
        Given I make a GET request to /api/v1/employees/test
        When I receive a response
        Then I assert response should have a status 400
        # 'error' is only one of the json response
        And I assert response should have a json like
            """
            {
                "error": "Bad Request"
            }
            """
