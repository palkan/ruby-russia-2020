# frozen_string_literal: true

require "rails_helper"

describe Albums::Tile::Component do
  fixtures :albums

  let(:album) { albums(:hardwired) }
  let(:options) { {album: album} }
  let(:component) { Albums::Tile::Component.new(**options) }

  subject { rendered_component }

  it "renders" do
    render_inline(component)

    is_expected.to have_css "img"
    is_expected.to have_text "Hardwired…To Self-Destruct"
    is_expected.to have_text "Metallica"
  end

  it "renders without image" do
    album.images = {}

    render_inline(component)

    is_expected.to have_no_css "img"
    is_expected.to have_text "Hardwired…To Self-Destruct"
    is_expected.to have_text "Metallica"
  end

  it "renders with collection" do
    render_inline described_class.with_collection([albums(:hardwired), albums(:sobranie)])

    is_expected.to have_text "Hardwired…To Self-Destruct"
    is_expected.to have_text "Metallica"
    is_expected.to have_text "Собрание"
    is_expected.to have_text "Король и шут"
  end
end
