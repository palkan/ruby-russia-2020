# frozen_string_literal: true

class Listening < ApplicationRecord
  belongs_to :user
  belongs_to :track, counter_cache: true

  after_create do
    Album.increment_counter(:listenings_count, track.album_id)
    Artist.increment_counter(:listenings_count, track.album.artist_id)
  end
end
