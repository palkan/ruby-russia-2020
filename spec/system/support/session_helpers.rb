# frozen_string_literal: true

module SessionHelpers
  def within_session(name, &block)
    Capybara.using_session(name, &block)
  end

  def login(user)
    page.driver.set_cookie(:uid, user.id.to_s)
  end

  def logout
    page.driver.clear_cookies
  end
end

RSpec.configure do |config|
  config.include SessionHelpers, type: :system
end
