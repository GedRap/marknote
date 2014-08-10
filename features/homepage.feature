Feature: I can visit homepage

    Scenario: Freshly installed
        When I visit the homepage
        Then I should see "MarkNote"