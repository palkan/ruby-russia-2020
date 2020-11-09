# frozen_string_literal: true

# frozen_string_literal

class AddTagsToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :tags, :string, array: true, null: false, default: []

    add_index :artists, :tags, using: :gin
  end
end
