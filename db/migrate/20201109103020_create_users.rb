# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, index: true
      t.text :password_digest
      t.timestamps
    end
  end
end
