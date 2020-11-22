# frozen_string_literal: true

class FavoritesController < ApplicationController
  def index
    @albums = Album.favorites(current_user.id).limit(10)
  end
end
