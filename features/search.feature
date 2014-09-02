Feature: Allow users to search by Bill id, legislator last name or bioguide_id, or title
    Search should be intelligent and take user to what they want immediately
    if there is no ambiguity or else go to a results page.

    Scenario: User searches for bill by bill_id
        Given User is on site
        When User searches by bill id
        Then User should be taken to page for that bill

    Scenario: User searches for legislator by bioguide_id
        Given User is on site
        When User searches by bioguide id
        Then User should be taken to page for that legislator

