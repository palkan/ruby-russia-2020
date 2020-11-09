# frozen_string_literal: true

require "rails_helper"

describe Track do
  fixtures :all

  let(:album) { albums(:hardwired) }
  let(:artist) { artists(:metallica) }

  describe "#create" do
    it "increment tracks_count for album and artist" do
      expect { album.tracks.create(title: "Confusion", position: 4, duration: 123) }
        .to change { album.reload.tracks_count }.by(1)
        .and change { artist.reload.tracks_count }.by(1)
    end
  end

  describe "#destroy" do
    let(:track) { tracks(:hardwired) }

    it "decrement tracks_count for album and artist" do
      expect { track.destroy! }
        .to change { album.reload.tracks_count }.by(-1)
        .and change { artist.reload.tracks_count }.by(-1)
    end
  end
end
