class UserProfile < ApplicationRecord
  belongs_to :user, optional: true # 応急処置オプしょなるあとではずす？
end
