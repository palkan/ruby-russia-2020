# frozen_string_literal: true

require "rails_helper"

describe Tracks::Tile::Component do
  fixtures :tracks

  let(:track) { tracks(:hardwired) }
  let(:options) { {track: track} }
  let(:component) { Tracks::Tile::Component.new(**options) }

  subject { rendered_component }

  it "renders" do
    render_inline(component)

    is_expected.to have_css "img"
    is_expected.to have_text "Hardwired"
    is_expected.to have_text "Metallica"
  end

  it "renders without image" do
    track.album.images = {}

    render_inline(component)

    is_expected.to have_no_css "img"
    is_expected.to have_text "Hardwired"
    is_expected.to have_text "Metallica"
  end

  it "renders with collection" do
    render_inline described_class.with_collection([tracks(:hardwired), tracks(:myaso)])

    is_expected.to have_text "Hardwired"
    is_expected.to have_text "Metallica"
    is_expected.to have_text "Ели мясо мужики"
    is_expected.to have_text "Король и шут"
  end
end
