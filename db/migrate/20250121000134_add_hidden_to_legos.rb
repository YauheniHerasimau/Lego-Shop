class AddHiddenToLegos < ActiveRecord::Migration[8.0]
  def change
    add_column :legos, :hidden, :boolean, default: false
  end
end
