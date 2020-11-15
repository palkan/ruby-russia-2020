# frozen_string_literal: true

class Artist::ComponentPreview < ApplicationViewComponentPreview
  def default
    artist = Artist.random.first

    render_component Artist::Component.new(artist: artist)
  end
end
