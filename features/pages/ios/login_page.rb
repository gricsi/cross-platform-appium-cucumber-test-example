require './features/pages/login_page'

module IOS
  class LoginPage < BaseLoginPage

    attr_reader :driver

    def initialize(driver)
      @driver = driver

      username = @driver.id('UsernameField')
      password = @driver.id('PasswordField')
      login_button = @driver.id('LoginButton')
      super(username, password, login_button)
    end

    def error_message
      @driver.id('LoginErrorLabel')
    end

  end
end
