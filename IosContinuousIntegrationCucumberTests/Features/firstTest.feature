Feature: Home screen activity

Background:
Given the app is running
And I am on the home screen

Scenario: Adding an entry
When I tap add button
Then A new entry is added to the list
When I swipe the entry to the left
And I tap delete button
Then the entry is deleted from the list
