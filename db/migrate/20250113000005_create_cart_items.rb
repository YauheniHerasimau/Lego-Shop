class CreateCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :lego, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
