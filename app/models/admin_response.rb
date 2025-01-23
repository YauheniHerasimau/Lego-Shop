class AdminResponse < ApplicationRecord
  belongs_to :opinion
  belongs_to :admin, class_name: "User", foreign_key: "user_id"

  validates :comment, presence: true
end
