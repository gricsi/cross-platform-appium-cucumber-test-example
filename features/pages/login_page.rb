class BaseLoginPage

  attr_accessor :username, :password, :login_button

  def initialize(username, password, login_button)
    @username = username
    @password = password
    @login_button = login_button
  end

  def fill_email(username)
     @username.send_keys(username)
  end

  def fill_password(password)
    @password.send_keys(password)
  end

  def click_to_login_button
    begin
      $driver.hide_keyboard #dont fail if keyboard is already hidden
    rescue Exception => e
      puts e
    end
    @login_button.click
  end

end