Feature: Allow users to search by Bill id, legislator last name or bioguide_id, or title
    Search should be intelligent and take user to what they want immediately
    if there is no ambiguity or else go to a results page.

    Scenario: User searches for bill by bill_id
        Given User is on site with only one bill
        When User searches by bill id
        Then User should be taken to page for that bill

    Scenario: User searches for legislator by bioguide_id
        Given User is on site with only one legislator
        When User searches by bioguide id
        Then User should be taken to page for that legislator

    Scenario: User searches for bill by title
        Given User is on site with only one bill
        When User searches by title
        Then User should be taken to result page with relevant bills

    Scenario: User searches but no results
        Given User is on site
        When User searches with unsearchable string
        Then User should be taken to result page with no results message

    Scenario: User searches without filling field
        Given User is on site with one legislator and one bill
        When User searches without filling search field
        Then User should be taken to result page with default results

