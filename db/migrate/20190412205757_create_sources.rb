# frozen_string_literal: true

class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :name, null: true, default: ''
      t.timestamps
    end
  end
end
