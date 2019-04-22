# frozen_string_literal: true

class AddDeactivatedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :status, :integer, null: false, default: 1
  end
end
