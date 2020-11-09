# frozen_string_literal: true

require "system_helper"

describe "Log in" do
  fixtures :users

  let(:user) { users(:matroskin) }

  before { user.update!(password: "бутерброд", password_confirmation: "бутерброд") }

  it "I can login from the dashboard" do
    visit root_path

    within "nav" do
      click_on "Войти"
    end

    expect(page).to have_text "Назови мне своё имя"
    expect(page).to have_current_path(login_path)

    fill_in :username, with: "Матроскин"
    fill_in :password, with: "бутерброд"

    click_on "Войти"

    expect(page).to have_text "Главное"
    expect(page).to have_current_path(root_path)

    within "nav" do
      expect(page).to have_text "Матроскин"
    end
  end
end
