class User < ApplicationRecord
    has_many :user_stylists
    has_many :stylists, through: :user_stylists

    has_secure_password

    validates_presence_of :username, :email
    validates_uniqueness_of :username, :email 

end
