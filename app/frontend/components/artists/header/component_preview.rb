# frozen_string_literal: true

class Artists::Header::ComponentPreview < ApplicationViewComponentPreview
  def with_cover
    artist = Artist.where.not(images: {}).random.first

    render_component Artists::Header::Component.new(artist: artist)
  end

  def without_cover
    artist = Artist.random.first
    artist.images = {}

    render_component Artists::Header::Component.new(artist: artist)
  end
end
