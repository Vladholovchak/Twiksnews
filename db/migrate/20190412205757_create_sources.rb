# frozen_string_literal: true

class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :google_id, null: false, default: ''
      t.string :name, null: false, default: ''
      t.timestamps
    end
  end
end
