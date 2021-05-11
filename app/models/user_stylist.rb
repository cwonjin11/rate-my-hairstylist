class UserStylist < ApplicationRecord
  belongs_to :user
  belongs_to :stylist

  # accepts_nested_attributes_for :stylist




end
