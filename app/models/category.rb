class Category < ApplicationRecord
  has_ancestry
  has_many :items
  # アソシエーションはhas_manyではなくbelongs_toだった
  belongs_to :size
end
