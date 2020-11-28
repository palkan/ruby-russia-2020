# frozen_string_literal: true

class Album < ApplicationRecord
  include HasImages
  include Search

  has_many :tracks, dependent: :destroy
  belongs_to :artist, counter_cache: true
  has_many :favorites, as: :like

  validates :title, length: {maximum: 255}

  scope :ordered, -> { order(year: :desc, created_at: :desc) }
  scope :popularity_ordered, -> { order(listenings_count: :desc) }

  def self.favorites(user_id)
    where(id: Favorite
                .where(user_id: user_id, track_id: nil)
                .where('album_id is not null').select('album_id as id'))
  end
end
