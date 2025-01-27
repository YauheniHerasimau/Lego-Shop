class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories, id: false do |t|
      t.belongs_to :category
      t.belongs_to :lego

      t.timestamps
    end
  end
end
