# frozen_string_literal: true

require "system_helper"

describe "Log in" do
  fixtures :users

  before { login users(:matroskin) }

  it "I can logout" do
    visit root_path

    within "nav" do
      expect(page).to have_text "Матроскин"

      click_on "Матроскин"

      within ".nav--right sl-dropdown" do
        click_button "Выйти"
      end

      expect(page).to have_text "Войти"
      expect(page).not_to have_text "Матроскин", wait: 0
    end
  end
end
