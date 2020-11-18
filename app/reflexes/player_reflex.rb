# frozen_string_literal: true

class PlayerReflex < ApplicationReflex
  def play
    track_id = element.dataset["track"]

    track = Track.find_by(id: track_id)

    return morph :nothing if current_track == track

    self.current_track = track
    session[:track_id] = track.id
    session[:play_list_type] = element.dataset["context"]
  end

  def pause
    track_id = element.dataset["track"]

    track = Track.find_by(id: track_id)

    return morph :nothing unless current_track == track

    self.current_track = nil
    session.delete(:track_id)
    session.delete(:play_list_type)
  end

  def previous
    track = resolve_playlist(session[:play_list_type]).previous(current_track)

    return morph :nothing if current_track == track

    self.current_track = track
    session[:track_id] = track.id
  end

  def next
    track = resolve_playlist(session[:play_list_type]).next(current_track)

    return morph :nothing if current_track == track

    self.current_track = track
    session[:track_id] = track.id
  end

  private

  def resolve_playlist(context)
    "Playlists::#{context.classify}".constantize
  end
end
