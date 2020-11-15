# frozen_string_literal: true

class Player::ComponentPreview < ApplicationViewComponentPreview
  self.default_locals = {
    container_class: "absolute w-full"
  }

  def default
    album = Album.random.first

    self.current_track = album.tracks.sample

    render_component Player::Component.new
  end

  def without_cover
    album = Album.random.first

    self.current_track = album.tracks.sample

    album.images = album.artist.images = {}

    render_component Player::Component.new
  end
end
