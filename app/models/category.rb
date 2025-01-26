class Category < ApplicationRecord
  has_many :lego_categories
  has_many :legos, through: :lego_categories
end
