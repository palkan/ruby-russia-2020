# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password validations: false

  has_many :listenings, dependent: :destroy
  has_many :recent_tracks, -> { order(Listening.arel_table[:created_at].desc) }, through: :listenings, source: :track

  validates :username, length: {maximum: 255}
end
