class AddBannedToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :banned, :boolean
  end
end
