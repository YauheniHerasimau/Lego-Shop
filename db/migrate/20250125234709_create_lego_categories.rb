class CreateLegoCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :lego_categories do |t|
      t.references :lego, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :lego_categories, [ :lego_id, :category_id ], unique: true
    # Ex:- add_index("admin_users", "username")
  end
end
