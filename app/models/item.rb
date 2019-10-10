class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

end
