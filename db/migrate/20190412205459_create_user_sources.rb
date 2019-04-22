# frozen_string_literal: true

class CreateUserSources < ActiveRecord::Migration[5.2]
  def change
    create_table :user_sources, id: false do |t|
      t.belongs_to :user
      t.belongs_to :source
      t.timestamps
    end
  end
end
