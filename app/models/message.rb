class Message < ApplicationRecord
  belongs_to :user
  has_one :reply
  validates :content, presence: true
  
  def mark_as_read
    update(admin_read: true)
  end
end
