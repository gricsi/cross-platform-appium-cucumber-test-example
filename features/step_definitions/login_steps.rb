Given(/^I (?:am|should stay) on the login page$/) do
  @login_page = $ENV::LoginPage.new($driver)

  assert_displayed(@login_page.username)
  assert_displayed(@login_page.password)
  assert_displayed(@login_page.login_button)
end

When(/^I fill in "(Email|Password)" with "([^"]*)"$/) do |field_name, value|
  if field_name == 'Email'
    @login_page.fill_email(value)
  else
    @login_page.fill_password(value)
  end
end

When(/^I press "Log in" button$/) do
  @login_page.click_to_login_button
end

Then(/^I should see an error message$/) do
  assert_displayed(@login_page.error_message)
end
