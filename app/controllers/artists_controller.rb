# frozen_string_literal: true

class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
  end
end
