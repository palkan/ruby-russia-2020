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

  def previous
    return self if first?

    Track.find_by(album_id: album_id, position: position - 1)
  end

  def next
    return self if last?

    Track.find_by(album_id: album_id, position: position + 1)
  end

  def first?
    position == 1
  end

  def last?
    album.tracks_count == position
  end
end
