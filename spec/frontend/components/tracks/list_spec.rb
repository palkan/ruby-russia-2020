# frozen_string_literal: true

require "rails_helper"

describe Tracks::List::Component do
  fixtures :tracks, :albums

  let(:album) { albums(:hardwired) }
  let(:options) { {tracks: album.tracks} }
  let(:component) { Tracks::List::Component.new(**options) }

  subject { rendered_component }

  it "renders tracks" do
    render_inline(component)

    album.tracks.each do |track|
      is_expected.to have_text track.title
    end
  end

  it "renders nothing when no tracks" do
    album.tracks = []

    render_inline(component)

    is_expected.to be_empty
  end

  it "renders playing track" do
    track = tracks(:hardwired)

    with_current_track(track) do
      render_inline(component)
    end

    is_expected.to have_css ".track:first-child .track--playing-indicator"
  end
end
