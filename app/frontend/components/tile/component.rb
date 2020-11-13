# frozen_string_literal: true

class Tile::Component < ApplicationViewComponent
  option :cover_url
  option :title
  option :title_link, default: proc { "javascript:void(0)" }
  option :author
  option :author_link, default: proc { "javascript:void(0)" }
end
