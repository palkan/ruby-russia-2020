# frozen_string_literal: true

class Album < ApplicationRecord
  include HasImages

  has_many :tracks, dependent: :destroy
  belongs_to :artist, counter_cache: true

  validates :title, length: {maximum: 255}

  scope :new_releases, -> { order(year: :desc, created_at: :desc) }
  scope :popular, -> { order(listenings_count: :desc) }
end
