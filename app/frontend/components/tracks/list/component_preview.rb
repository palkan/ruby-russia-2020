# frozen_string_literal: true

class Tracks::List::ComponentPreview < ApplicationViewComponentPreview
  self.default_locals = {
    container_class: "w-1/3"
  }

  def without_user
    tracks = Album.random.first.tracks.ordered

    self.current_track = tracks.sample if current_user

    render_component Tracks::List::Component.new(tracks: tracks)
  end

  def with_user
    self.current_user = User.new

    without_user
  end
end
