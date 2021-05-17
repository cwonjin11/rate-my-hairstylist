class Stylist < ApplicationRecord
    has_many :user_stylists
    has_many :users, through: :user_stylists

   
    validates_presence_of :name, :shop_name, :address
    validates :phone, :presence => true, :phone => true
    
    ##### make upcase, downcase as the same name #####
    validates :name, uniqueness: { case_sensitive: false }
    validates_uniqueness_of :phone, :case_sensitive => false
  


    # def downcase_name  => don't need bc i have validation instead
    #   self.name = self.name.try(:downcase)
    # end

  
    #hair stylist average rating#
    def average_rating
        UserStylist.where(stylist_id: self.id).average(:stars).to_f.round(1)
    end

    def hairstylist_rating
      UserStylist.find_by(stylist_id: self.id).stars
    end

    #### scope method ####
    scope :most_reviews, -> {(
      select("stylists.name, stylists.id, count(user_stylists.id) as user_stylists_count")
      .joins(:user_stylists)
      .group("stylists.id")
      .order("user_stylists_count DESC", "stylists.name ASC")
      .limit(5)
    )}

    

    # joins(:user_stylists)
    # .group("stylists.id")

      # scope :stars_more_than, ->(amount) { where("price > ?", amount) }




      # def self.find_by_name(letter)
      #   where('name LIKE ?', "#{letter}%").order('name ASC')
      # end
end
