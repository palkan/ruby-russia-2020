# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password validations: false

  has_many :listenings, dependent: :destroy
  has_many :recent_tracks, -> { order(Listening.arel_table[:created_at].desc) }, through: :listenings, source: :track

  has_many :favorites, dependent: :destroy
  has_many :favorite_albums, through: :favorites, class_name: "Album", source: :like, source_type: "Album"
  has_many :favorite_tracks, through: :favorites, class_name: "Track", source: :like, source_type: "Track"

  validates :username, length: {maximum: 255}

  def favorite_album?(album)
    favorite_albums
      .where(id: album&.id)
      .exists?
  end
end
