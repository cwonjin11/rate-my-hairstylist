class User < ApplicationRecord
    has_many :user_stylists
    has_many :stylists, through: :user_stylists

    has_secure_password
    

end
