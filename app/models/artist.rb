# frozen_string_literal: true

class Artist < ApplicationRecord
  include HasImages

  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums

  validates :name, length: {maximum: 255}
end
