class Opinion < ApplicationRecord
  belongs_to :user
  belongs_to :lego
  has_one :admin_response, dependent: :destroy

  validates :user_id, uniqueness: { scope: :lego_id }
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true
end
