class CreateAdminMessageResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :create_admin_message_responses do |t|
      t.references :message, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true
      t.text :response_content

      t.timestamps
    end
  end
end
