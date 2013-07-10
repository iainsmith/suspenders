@disable-bundler
Feature: Enabling Sidekiq rather than Delayed Job
  Background:
    Given I ensure no databases exist for "test_project"

  Scenario: --background_worker=sidekiq
    When I suspend a project called "test_project" with:
      | argument            | value   |
      | --background_worker | sidekiq |
    And I cd to the "test_project" root
    And I generate "model post title:string"
    Then I can cleanly rake the project
    And "delayed_job_active_record" should not be installed
    And "sidekiq" should be installed

