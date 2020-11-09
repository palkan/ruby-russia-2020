# frozen_string_literal: true

class Genre < ApplicationRecord
  class << self
    def increment_tags(tags)
      return if tags.empty?

      now = Time.zone.now
      upsert_all(tags.map { |tag| {name: tag, created_at: now, updated_at: now} }, unique_by: %i[name])

      where(name: tags).update_all("artists_count = artists_count + 1")
    end

    def decrement_tags(tags)
      return if tags.empty?

      where(name: tags).update_all("artists_count = artists_count - 1")
      where(artists_count: 0).delete_all
    end
  end

  validates :name, length: {maximum: 255}
end
