Feature: Creating and Retreiving notes

    Scenario: Visit homepage and create a note
        When I visit the homepage
        Then I type in "Foo" in "title"
        Then I type in "tag1, tag2" in "tags"
        Then I type in "Hello *world*" in "source"
        When I click on "Save"
        Then I should see "Created at"
        Then I should see "Hello world"
        Then I should see "Foo"

        When I visit the homepage
        Then I should see "Foo"

        When I visit Notes
        Then I should see "Foo"

        When I visit Tags
        Then I should see "tag1"
        Then I should see "tag2"

    Scenario: Search for the note
        When I visit the homepage
        Then I type in "Foo" in "query"
        When I click on "Submit"
        Then I should see "Foo"