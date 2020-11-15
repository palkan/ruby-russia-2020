# frozen_string_literal: true

class Album::ComponentPreview < ApplicationViewComponentPreview
  self.default_locals = {
    container_class: "w-1/3 p-4"
  }

  def default
    self.current_user = User.new

    album = Album.random.first

    self.current_track = album.tracks.sample

    render_component Album::Component.new(album: album)
  end
end
