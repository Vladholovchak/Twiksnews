# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.belongs_to :source
      t.string :title, null: false, default: ''
      t.string :description, null: true, default: ''
      t.string :url, null: true, default: ''
      t.string :url_to_image, null: true, default: ''
      t.datetime :published_at, null: false, default: '2019-04-13 17:48:19'
      t.string :content, null: true, default: ''
      t.timestamps
    end
  end
end
