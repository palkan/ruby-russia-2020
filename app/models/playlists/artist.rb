# frozen_string_literal: true

module Playlists
  module Artist
    module_function

    def tracks(artist)
      artist.tracks.popularity_ordered.order(:id).limit(10)
    end

    def previous(current_track)
      artist = current_track.album.artist
      offset = tracks(artist).ids.index(current_track.id)

      return current_track if offset.nil? || offset.zero?

      tracks(artist).offset(offset - 1).take
    end

    def next(current_track)
      artist = current_track.album.artist
      track_ids = tracks(artist).ids
      offset = track_ids.index(current_track.id)

      return current_track if offset.nil? || offset.next == track_ids.size

      tracks(artist).offset(offset + 1).take
    end
  end
end
