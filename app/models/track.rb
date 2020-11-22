# frozen_string_literal: true

# frozen_string_literal

class Track < ApplicationRecord
  belongs_to :album, counter_cache: true

  has_many :listenings, dependent: :destroy

  validates :title, length: {maximum: 255}

  after_create do
    Artist.increment_counter(:tracks_count, album.artist_id)
  end

  after_destroy do
    Artist.decrement_counter(:tracks_count, album.artist_id)
  end

  scope :ordered, -> { order(position: :asc) }
  scope :popularity_ordered, -> { order(listenings_count: :desc) }

  def self.favorites(user_id)
    where(id: Favorite
                .where(user_id: user_id, album_id: nil)
                .where('track_id is not null').select('track_id as id'))
  end
end
