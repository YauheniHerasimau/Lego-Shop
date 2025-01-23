class CreateAdminResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :admin_responses do |t|
      t.references :opinion, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
