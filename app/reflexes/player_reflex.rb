# frozen_string_literal: true

class PlayerReflex < ApplicationReflex
  def play
    track_id = element.dataset["track"]

    track = Track.find_by(id: track_id)

    return morph :nothing if current_track == track

    track_to_session(track)
  end

  def pause
    track_id = element.dataset["track"]

    track = Track.find_by(id: track_id)

    return morph :nothing unless current_track == track

    track_to_session(nil)
  end

  def forward
    track_id = element.dataset["track"]
    track = Track.find_by(id: track_id)
    next_track = Track.find_by(album: track&.album, position: track&.position.to_i + 1)

    track_to_session(next_track)
  end

  def rewind
    track_id = element.dataset["track"]
    track = Track.find_by(id: track_id)
    next_track = Track.find_by(album: track&.album, position: track&.position.to_i - 1)

    track_to_session(next_track)
  end

  private

  def track_to_session(next_track)
    self.current_track = next_track
    if next_track
      session[:track_id] = next_track.id
    else
      session.delete(:track_id)
    end
  end
end
