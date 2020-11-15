# frozen_string_literal: true

require "rails_helper"

describe Album::Component do
  fixtures :albums, :tracks

  let(:album) { albums(:hardwired) }
  let(:options) { {album: album} }
  let(:component) { Album::Component.new(**options) }

  subject { rendered_component }

  it "renders" do
    render_inline(component)

    is_expected.to have_text album.title
    is_expected.to have_text album.year
    is_expected.to have_text album.artist.name

    album.tracks.each do |track|
      is_expected.to have_text track.title
    end
  end
end
