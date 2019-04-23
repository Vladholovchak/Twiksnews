# frozen_string_literal: true

class CreateNewsUserSources < ActiveRecord::Migration[5.2]
  def change
    create_table :user_news_sources, id: false do |t|
      t.belongs_to :user
      t.belongs_to :news_source
      t.timestamps
    end
  end
end
