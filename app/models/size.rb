class Size < ApplicationRecord
  has_many :categories
  # has_many :items
  has_ancestry
end
