# frozen_string_literal: true

class Player::Component < ApplicationViewComponent
  alias_method :track, :current_track

  delegate :album, to: :track
  delegate :artist, :tracks, to: :album
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

  def reflex_play_data(track)
    return {} if track.blank?

    {reflex: "click->Player#play", track: track.id}
  end

  def prev_track
    return if track.position < 2

    @prev_track ||= take_with_offset(track.position - 2)
  end

  def next_track
    return if track.position == tracks.size

    @next_track ||= take_with_offset(track.position)
  end

  private

  def take_with_offset(offset)
    tracks.order(position: :asc).offset(offset).take
  end
end
