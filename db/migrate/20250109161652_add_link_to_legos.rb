class AddLinkToLegos < ActiveRecord::Migration[8.0]
  def change
    add_column :legos, :link, :string
  end
end
