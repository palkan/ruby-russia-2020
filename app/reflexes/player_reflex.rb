# frozen_string_literal: true

class PlayerReflex < ApplicationReflex
  def play
    track_id = element.dataset["track"]

    track = Track.find_by(id: track_id)

    return morph :nothing if current_track == track

    self.current_track = track
    session[:track_id] = track.id
  end

  def pause
    track_id = element.dataset["track"]

    track = Track.find_by(id: track_id)

    return morph :nothing unless current_track == track

    self.current_track = nil
    session.delete(:track_id)
  end

  def previous
    track = current_track.previous

    return morph :nothing if current_track == track

    self.current_track = track
    session[:track_id] = track.id
  end

  def next
    track = current_track.next

    return morph :nothing if current_track == track

    self.current_track = track
    session[:track_id] = track.id
  end
end
