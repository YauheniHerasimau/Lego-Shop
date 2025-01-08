class CreateLegos < ActiveRecord::Migration[8.0]
  def change
    create_table :legos do |t|
      t.string :name
      t.text :description
      t.string :lego_set
      t.string :image_url
      t.integer :details
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
