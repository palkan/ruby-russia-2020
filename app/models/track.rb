# frozen_string_literal: true

# frozen_string_literal

class Track < ApplicationRecord
  belongs_to :album, counter_cache: true

  has_many :listenings, dependent: :destroy
  has_many :favorites, as: :like

  validates :title, length: { maximum: 255 }

  after_create do
    Artist.increment_counter(:tracks_count, album.artist_id)
  end

  after_destroy do
    Artist.decrement_counter(:tracks_count, album.artist_id)
  end

  scope :ordered, -> { order(position: :asc) }
  scope :popularity_ordered, -> { order(listenings_count: :desc) }

  # использование
  #  tracks.join_favorites(current_user&.id)
  # потом:
  #  track.favorite?
  def self.join_favorites(user_id)
    joins("LEFT JOIN favorites f ON tracks.id = f.track_id AND f.album_id is null AND f.user_id = #{user_id.to_i}")
      .select("tracks.*, f.id AS favorite")
  end
end
