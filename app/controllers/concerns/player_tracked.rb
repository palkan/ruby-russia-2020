# frozen_string_literal: true

module PlayerTracked
  extend ActiveSupport::Concern

  include Dry::Effects::Handler.State(:current_track)

  included do
    around_action :set_current_track
  end

  private

  def set_current_track
    track = Track.find_by(id: session[:track_id])
    with_current_track(track) { yield }
  end
end
