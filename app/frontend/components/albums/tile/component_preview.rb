# frozen_string_literal: true

class Albums::Tile::ComponentPreview < ApplicationViewComponentPreview
  self.default_locals = {
    container_class: "tiles-grid"
  }

  def without_user
    albums = Album.random.limit(3)

    # Album without a cover
    albums.last.images = {}

    render_component Albums::Tile::Component.with_collection(albums)
  end

  def with_user
    self.current_user = User.new

    without_user
  end
end
