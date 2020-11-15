# frozen_string_literal: true

class Tracks::Tile::ComponentPreview < ApplicationViewComponentPreview
  self.default_locals = {
    container_class: "tiles-row"
  }

  def without_user
    tracks = Track.random.limit(10)

    # Album without a cover
    tracks.last.album.images = {}

    render_component Tracks::Tile::Component.with_collection(tracks)
  end

  def with_user
    self.current_user = User.new

    without_user
  end
end
