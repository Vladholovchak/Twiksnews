class AddSendNewsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :send_news, :boolean, default: false
  end
end
