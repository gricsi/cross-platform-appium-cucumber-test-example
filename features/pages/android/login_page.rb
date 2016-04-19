require './features/pages/login_page'

module Android
  class LoginPage < BaseLoginPage

    attr_reader :driver

    def initialize(driver)
      @driver = driver

      username = @driver.id('username')
      password = @driver.id('password')
      login_button = @driver.id('login_bt')
      super(username, password, login_button)
    end

    def error_message
      @driver.id('login_error')
    end

  end
end