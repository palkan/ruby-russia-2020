# frozen_string_literal: true

module PlayerTracked
  extend ActiveSupport::Concern

  include Dry::Effects::Handler.State(:current_track)
  include Dry::Effects.State(:current_track)

  included do
    around_action :set_current_track

    helper_method :current_track, :current_aside_album
  end

  private

  def set_current_track
    track = Track.find_by(id: session[:track_id])
    with_current_track(track) { yield }
  end

  def current_aside_album
    return @current_aside_album if defined?(@current_aside_album)

    @current_album = session[:album_id] && Album.find_by(id: session[:album_id])
  end
end
