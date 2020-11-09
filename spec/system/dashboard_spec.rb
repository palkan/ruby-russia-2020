# frozen_string_literal: true

require "system_helper"

describe "/" do
  specify do
    visit root_path

    expect(page).to have_text "Главное"
  end
end
