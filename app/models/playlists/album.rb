# frozen_string_literal: true

module Playlists
  module Album
    module_function

    def tracks(album)
      album.tracks.ordered
    end

    def previous(current_track)
      return current_track self if current_track.position == 1

      Track.find_by(album_id: current_track.album_id, position: current_track.position - 1)
    end

    def next(current_track)
      return current_track self if current_track.album.tracks_count == current_track.position

      Track.find_by(album_id: current_track.album_id, position: current_track.position + 1)
    end
  end
end
