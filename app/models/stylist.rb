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
        #find @stylist and make average of stars from @stylist.user_stylist where @stylist id and user_Stylist stylist_id matched.  and then make it float value and round from the first decimal place.
    end

    def hairstylist_rating
      UserStylist.find_by(stylist_id: self.id).stars
    end

    #### scope method ####
    # Stylist.joins(:user_stylists).group('stylists.id').order('count(user_stylists.id) desc')
    scope :most_reviews, -> {(joins(:user_stylists).group('stylists.id').order('count(user_stylists.id) desc', 'stylists.name ASC')
      # select("stylists.name, stylists.id, count(user_stylists.id) as user_stylists_count")
      # .joins(:user_stylists)
      # .group("stylists.id")
      # .order("user_stylists_count DESC", "stylists.name ASC")
      # .limit(5)
    )}

    #### alpha ordering###
    scope :alpha_order_by_name, -> { order(:name) }
      # scope :price_more_than, ->(amount) { where("price > ?", amount) }



 ########name start with 'letter'###################
      # def self.find_by_name(letter)
      #   where('name LIKE ?', "#{letter}%").order('name DESC')
      # end
     # @stylists = Stylist.find_by_name('sa')     # << LIVE CODE PRACTICE : display stylist name starts with (sa) #{}%

 ########shop_namename start with 'letter'###################
      # def self.find_by_shop(letter)
      #   where('shop_name LIKE ?', "%#{letter}%").order('shop_name DESC')
      # end
  # @stylists = Stylist.find_by_shop('am')     # << LIVE CODE PRACTICE : display shop name includes with (am) %#{}%


end
