# frozen_string_literal: true

class Tracks::Tile::Component < ApplicationViewComponent
  with_collection_parameter :track

  option :track

  delegate :album, to: :track
  delegate :artist, to: :album
end
