class CreateJoinTableCategoriesLegos < ActiveRecord::Migration[8.0]
  def change
    create_join_table :categories, :legos do |t|
      t.index [ :category_id, :lego_id ]
      t.index [ :lego_id, :category_id ]
    end
  end
end
