# frozen_string_literal: true

module PlayerTracked
  extend ActiveSupport::Concern

  include Dry::Effects::Handler.State(:current_track)
  include Dry::Effects.State(:current_track)

  included do
    around_action :set_current_track

    helper_method :open_album, :current_track
  end

  private

  def open_album
    return @open_album if defined?(@open_album)

    album_id = params[:album] || session[:album_id]

    return @open_album = nil unless album_id

    @open_album = Album.find_by(id: album_id).tap do |album|
      session[:album_id] = album&.id
    end
  end

  def set_current_track
    track = Track.find_by(id: session[:track_id])
    with_current_track(track) { yield }
  end
end
