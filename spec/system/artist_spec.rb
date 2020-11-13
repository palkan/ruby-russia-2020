# frozen_string_literal: true

require "system_helper"

describe "Artist" do
  fixtures :all

  specify do
    visit artist_path(artists(:metallica))

    expect(page).to have_text "Metallica"

    within ".artist-header--meta" do
      expect(page).to have_text "Metal"
      expect(page).to have_text "Rock"
    end

    click_on "Информация"

    expect(page).to have_text "Heavy metal from the past"

    click_on "Альбомы"

    expect(page).to have_text "Hardwired…To Self-Destruct"
    expect(page).to have_text "St. Anger"

    click_on "Треки"

    # The first track is the most listened one
    within ".track:first-child" do
      expect(page).to have_text "St. Anger"
    end
  end
end
