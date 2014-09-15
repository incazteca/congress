Feature: User registers themselves with the site
    In order for the user to use the tagging features
    They need to register for the site

    @javascript
    Scenario: User is registering to site
        Given User is on registrations page
        When User inputs correct information into registration form
        Then User should be notified of succesful registration and logged in

    @javascript
    Scenario: User is registering to site unsuccesfully
        Given User is on registrations page
        When User inputs invalid information into registration form
        Then User should be notified of invalid registration

