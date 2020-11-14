# frozen_string_literal: true

class Player::Component < ApplicationViewComponent
  alias_method :track, :current_track

  delegate :album, to: :track
  delegate :artist, to: :album
  delegate :title, to: :track
  delegate :name, to: :artist, prefix: true

  def render?
    current_track
  end

  def duration
    seconds_to_duration(track.duration)
  end

  def cover
    @cover ||= album.image_medium || artist.image_medium
  end
end
