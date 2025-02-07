class Reply < ApplicationRecord
  belongs_to :message
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
end
