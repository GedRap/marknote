Feature: Modifying and Deleting notes

    Scenario: Visit homepage and create a note, then successfully edit it
        When I visit the homepage
        Then I type in "Editing" in "title"
        Then I type in "tag1, tag2" in "tags"
        Then I type in "Hello *world*" in "source"
        
        When I click on "Save"
        Then I should see "Created at"
        Then I should see "Hello world"
        Then I should see "Editing"

        When I click on element "edit"
        Then I should see "Editing Editing"
        Then I type in "Edited" in "title"

        When I click on "Save"
        Then I should see "Edited"

    Scenario: Visit homepage and create a note, then successfully delete it
        When I visit the homepage
        Then I type in "Deleting" in "title"
        Then I type in "tag1, tag2" in "tags"
        Then I type in "Hello *world*" in "source"
        
        When I click on "Save"
        Then I should see "Created at"
        Then I should see "Deleting"

        When I click on element "delete"
        Then I should not see "Deleting"