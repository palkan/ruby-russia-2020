# frozen_string_literal: true

class Tile::Component < ApplicationViewComponent
  option :cover_url

  with_content_areas :title, :author
end
