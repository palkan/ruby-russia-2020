# frozen_string_literal: true

class Albums::Tile::Component < ApplicationViewComponent
  with_collection_parameter :album

  option :album

  delegate :artist, to: :album
end
