class Stylist < ApplicationRecord
    has_many :user_stylists
    has_many :users, through: :user_stylists

end
