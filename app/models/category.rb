class Category < ApplicationRecord
  has_many :lego_categories
  has_and_belongs_to_many :legos
end
