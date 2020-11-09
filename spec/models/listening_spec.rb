# frozen_string_literal: true

require "rails_helper"

describe Listening do
  fixtures :all

  let(:user) { users(:matroskin) }

  let(:track) { tracks(:hardwired) }
  let(:album) { albums(:hardwired) }
  let(:artist) { artists(:metallica) }

  describe "#create" do
    it "increment listenings_count for track, album and artist" do
      expect { user.listenings.create(track: track) }
        .to change { track.reload.listenings_count }.by(1)
        .and change { album.reload.listenings_count }.by(1)
        .and change { artist.reload.listenings_count }.by(1)
    end
  end
end
