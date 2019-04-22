# frozen_string_literal: true

class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :deactivated, :boolean
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :sources, :google_id, :string
    remove_column :articles, :content, :string
    remove_column :sources, :total, :integer
  end
end
