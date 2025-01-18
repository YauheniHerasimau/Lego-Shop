class CreateOpinions < ActiveRecord::Migration[8.0]
  def change
    create_table :opinions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lego, null: false, foreign_key: true
      t.integer :rating, null: false
      t.text :comment, null: false

      t.timestamps
    end

    add_index :opinions, [:user_id, :lego_id], unique: true
  end
end
