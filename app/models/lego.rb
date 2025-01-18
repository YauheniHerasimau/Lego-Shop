class Lego < ApplicationRecord
  has_many :opinions, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  def average_rating
    opinions.average(:rating).to_i
  end

  validates :name, presence: true
end
