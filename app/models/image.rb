class Image < ApplicationRecord
  belongs_to :item, optional: true
  #validates :item_id, presence: true
  mount_uploader :image, ImageUploader
end
