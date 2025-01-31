class Message < ApplicationRecord
  belongs_to :user
  has_one :admin_message_response

  validates :content, presence: true
end
