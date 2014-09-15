Feature: Users log into Congress web application
    In order to use the site features such as tagging
    Then need to be logged in

    @javascript
    Scenario: User is logging in successfully
        Given User is on login page with account
        When User inputs correct credentials
        Then User should be logged in

    @javascript
    Scenario: User is logging in with wrong password
        Given User is on login page with account
        When User inputs incorrect password
        Then User should be notified of invalid login

    @javascript
    Scenario: User is logging in with invalid email
        Given User is on login page with no account
        When User inputs incorrect email
        Then User should be notified of non-existant account
