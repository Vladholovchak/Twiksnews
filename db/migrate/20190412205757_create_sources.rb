# frozen_string_literal: true

class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :google_id, null: true, default: ''
      t.string :name, null: true , default: ''
      t.integer :total, default: 0
      t.timestamps
    end
  end
end
