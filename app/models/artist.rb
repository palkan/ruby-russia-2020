# frozen_string_literal: true

class Artist < ApplicationRecord
  include HasImages

  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums

  validates :name, length: {maximum: 255}

  scope :by_genres, (lambda do |*genres|
    next if genres.empty?

    arel_condition = Arel::Nodes::InfixOperation.new(
      "&&",
      arel_table[:tags],
      Arel::Nodes.build_quoted(genres, arel_table[:tags])
    )

    where(arel_condition)
  end)

  after_create do
    Genre.increment_tags(tags)
  end

  after_update do
    next unless saved_change_to_tags?

    old_tags, new_tags = saved_change_to_tags

    Genre.increment_tags(new_tags - old_tags)
    Genre.decrement_tags(old_tags - new_tags)
  end

  after_destroy do
    Genre.decrement_tags(tags)
  end
end
