Feature: To allow tagging of bills or legislators for users.
    Tagging a legislator or bill will allow the user to receive updates
    pertaining to what they tagged.

    Scenario: User attempts to tag without being logged in
        Given User is not signed in
        Given Legislator
        When User attempts to tag a legislator
        Then User should not see a tag button with "Tag for Updates"

    Scenario: User attempts to tag non active bill
        Given User is signed in
        Given Non Active bill
        When User attempts to tag a bill
        Then User should not see a tag button with "Tag for Updates"

    Scenario: User attempts to tag active bill
        Given User is signed in
        Given Active bill
        When User attempts to tag a bill
        Then Tag button should read "Tagged for Updates"

    Scenario: User attempts to tag legislator
        Given User is signed in
        Given Legislator
        When User attempts to tag a legislator
        Then Tag button should read "Tagged for Updates"

