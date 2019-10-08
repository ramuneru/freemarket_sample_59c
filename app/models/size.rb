class Size < ApplicationRecord
  has_many :categories
  has_ancestry
end
