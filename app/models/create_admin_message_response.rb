class CreateAdminMessageResponse < ApplicationRecord
  belongs_to :message
  belongs_to :admin
end
