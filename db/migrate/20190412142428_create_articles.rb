class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.belongs_to :source
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :url, null: false, default: ""
      t.string :url_to_image, null: false, default: ""
      t.datetime :published_at, null: false, default: Time.now
      t.string :content, null: false, default: ""
      t.timestamps
    end
  end
end
