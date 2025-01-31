class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :create_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject
      t.text :content, null: false
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
