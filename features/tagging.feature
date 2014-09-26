Feature: To allow tagging of bills or legislators for users.
    Tagging a legislator or bill will allow the user to receive updates
    pertaining to what they tagged.

    Background:
        Given User is signed in

    @javascript
    Scenario: User attempts to tag non active bill
        Given Non Active bill
        Then User should not see a tag button with "Tag for Updates"

    @javascript
    Scenario: User attempts to tag active bill
        Given Active bill
        When User attempts to tag a bill
        Then Tag button should read "Tagged for Updates"

    @javascript
    Scenario: User attempts to tag legislator
        Given User is on Legislator page
        When User attempts to tag a legislator
        Then Tag button should read "Tagged for Updates"

