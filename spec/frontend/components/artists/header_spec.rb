# frozen_string_literal: true

require "rails_helper"

describe Artists::Header::Component do
  fixtures :artists

  let(:artist) { artists(:kish) }
  let(:options) { {artist: artist} }
  let(:component) { Artists::Header::Component.new(**options) }

  subject { rendered_component }

  it "renders" do
    render_inline(component)

    is_expected.to have_text "Король и шут"
    is_expected.to have_text "Rock"
    is_expected.to have_text "Punk"
    is_expected.to have_css "img"
  end

  it "renders without image" do
    artist.images = {}

    render_inline(component)

    is_expected.to have_text "Король и шут"
    is_expected.to have_no_css "img"
  end
end
