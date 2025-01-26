class Lego < ApplicationRecord
  has_many :opinions, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :lego_categories
  has_many :categories, through: :lego_categories

  scope :by_category, ->(category_id) { joins(:lego_categories).where(lego_categories: { category_id: category_id }).distinct }

  def average_rating
    opinions.average(:rating).to_i
  end

  def hidden?
    hidden
  end

  validates :name, presence: true
end
