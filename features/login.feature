@login @android @ios @acceptance
Feature: Login

  @login_1
  Scenario Outline: Successful login with a good credentials
    Given I am on the login page
    When I fill in "Email" with "<username>"
    And I fill in "Password" with "<password>"
    When I press "Log in" button
    Then homepage should be displayed

    Examples:
      | username | password |
      | test     | pwd      |


  @login_2
  Scenario Outline: Cannot login with a wrong credentials
    Given I am on the login page
    When I fill in "Email" with "<username>"
    And I fill in "Password" with "<password>"
    When I press "Log in" button
    Then I should see an error message


    Examples:
      | username | password |
      | test     | wrong    |
      | wrong    | pwd      |

  @login_3
  Scenario: Cannot login without username or password
    Given I am on the login page
    When I fill in "Email" with ""
    And I fill in "Password" with ""
    When I press "Log in" button
    Then I should stay on the login page
