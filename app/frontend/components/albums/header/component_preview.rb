# frozen_string_literal: true

class Albums::Header::ComponentPreview < ApplicationViewComponentPreview
  self.default_locals = {
    container_class: "w-1/3"
  }

  def without_user
    album = Album.random.first

    self.current_track = album.tracks.sample

    render_component Albums::Header::Component.new(album: album)
  end

  def with_user
    self.current_user = User.new

    without_user
  end
end
