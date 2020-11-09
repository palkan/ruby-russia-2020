# frozen_string_literal: true

require "system_helper"

describe "Dashboard" do
  fixtures :all

  specify "when not logged in" do
    visit root_path

    expect(page).to have_text "Главное"
    expect(page).to have_text "Новые релизы", wait: 0
    expect(page).to have_text "Популярные альбомы", wait: 0

    within "#new li:first-child" do
      expect(page).to have_text "Hardwired", wait: 0
    end

    within "#popular li:first-child" do
      expect(page).to have_text "Собрание", wait: 0
    end
  end

  specify "when logged in" do
    login users(:matroskin)

    visit root_path

    expect(page).to have_text "Главное"
    expect(page).to have_text "Новые релизы", wait: 0
    expect(page).to have_text "История прослушивания", wait: 0

    within "#new li:first-child" do
      expect(page).to have_text "Hardwired", wait: 0
    end

    within "#history li:first-child" do
      expect(page).to have_text "Ели мясо мужики", wait: 0
    end
  end

  specify "I can open artist page" do
    visit root_path

    expect(page).to have_text "Главное"

    within "#new li:first-child" do
      click_on "Metallica"
    end

    expect(page).to have_current_path(artist_path(artists(:metallica)))
  end
end
