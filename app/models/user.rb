# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password validations: false

  has_many :listenings, dependent: :destroy
  has_many :recent_tracks, -> { order(Listening.arel_table[:created_at].desc) }, through: :listenings, source: :track

  has_many :favorites, dependent: :destroy
  has_many :favorite_albums, -> { where("favorites.track_id is null") }, through: :favorites, source: :album

  has_many :favorite_tracks, -> { where("favorites.album_id is null") }, through: :favorites, source: :track

  validates :username, length: { maximum: 255 }

  def favorite_album?(album)
    favorite_albums
      .where(id: album&.id)
      .exists?
  end
end
