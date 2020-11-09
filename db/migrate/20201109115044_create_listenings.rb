# frozen_string_literal: true

class CreateListenings < ActiveRecord::Migration[6.1]
  def change
    create_table :listenings do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :track, foreign_key: true, null: false

      t.timestamps
    end
  end
end
