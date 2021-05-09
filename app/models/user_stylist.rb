class UserStylist < ApplicationRecord
  belongs_to :user
  belongs_to :stylist
end
