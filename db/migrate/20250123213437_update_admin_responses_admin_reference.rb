class UpdateAdminResponsesAdminReference < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :admin_responses, :admins
    rename_column :admin_responses, :admin_id, :user_id
    add_foreign_key :admin_responses, :users
    # Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
