# frozen_string_literal: true

require "system_helper"

describe "Artist" do
  fixtures :all

  specify do
    visit artist_path(artists(:metallica))

    expect(page).to have_text "Metallica"
    expect(page).to have_text "Heavy metal from the past"

    within "#albums" do
      expect(page).to have_text "Hardwired…To Self-Destruct"
      expect(page).to have_text "St. Anger"
    end

    # The first track is the most listened one
    within "#tracks li:first-child" do
      expect(page).to have_text "St. Anger"
    end
  end
end
