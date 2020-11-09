# frozen_string_literal: true

class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false, index: {unique: true}

      t.integer :artists_count, null: false, default: 0

      t.timestamps
    end
  end
end
