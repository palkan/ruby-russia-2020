# frozen_string_literal: true

require "rails_helper"

describe Albums::Header::Component do
  fixtures :albums, :tracks

  let(:album) { albums(:hardwired) }
  let(:options) { {album: album} }
  let(:component) { Albums::Header::Component.new(**options) }

  subject { rendered_component }

  it "renders" do
    render_inline(component)

    is_expected.to have_text album.title
    is_expected.to have_text album.year
    is_expected.to have_text album.artist.name
  end

  xit "renders pause button when playing" do
    with_current_track(tracks(:hardwired)) do
      render_inline(component)
    end

    is_expected.to have_css "??"
  end
end
