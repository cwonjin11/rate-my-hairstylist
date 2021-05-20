class Stylist < ApplicationRecord
    has_many :user_stylists
    has_many :users, through: :user_stylists

   
    validates_presence_of :name, :phone, :shop_name, :address
    validates :phone, :presence => true, :phone => true
    
    ##### make upcase, downcase as the same name #####
    validates :name, uniqueness: { case_sensitive: false }
    validates_uniqueness_of :phone, :case_sensitive => false
  

    #single hair stylist average rating#
    def average_rating
        UserStylist.where(stylist_id: self.id).average(:stars).to_f.round(1)
        #find @stylist and make average of stars from @stylist.user_stylist where @stylist id and user_Stylist stylist_id matched.  and then make it float value and round from the first decimal place.
    end


  # hairstylist name by alphabeical order 
    scope :alphabetical_order, -> { order(:name) }
      # def self.alphabetical_order
      #   order(:name)
      # end




  # Most Reviewed Hairstylists!! on PAGES#INDEX
    scope :most_reviews, -> {(joins(:user_stylists)
      .group('stylists.id')
      .order('count(user_stylists.id) desc', 'stylists.name ASC')
      .limit(10)
    )}

  
  # Top 5 high rated hairstylists (more than 3 reviews) on PAGES#INDEX
    scope :overall_ratings_more_than_3_reviews, -> {(joins(:user_stylists)
      .group('stylists.id')
      .having('count(stylists.id)>2')
      .order('avg(stars) desc')
      .limit(5)
    )}
      # def self.overall_ratings_more_than_3_reviews  #at least 3 reviews with overall ratings
      #   joins(:user_stylists).group('stylists.id').having('count(stylists.id)>2').order('avg(stars) desc').limit(5)
      # end


      # Top 5 high rated hairstylists (without reviews count limit)
      # scope :stylist_overall_ratings, ->{(joins(:user_stylists).group('stylists.id').order('avg(stars) desc').limit(5))}


end



  
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



    # def downcase_name  => don't need bc i have validation instead
    #   self.name = self.name.try(:downcase)
    # end


        # def self.average_rating
    #     UserStylist.where(stylist_id: self.id).average(:stars).to_f.round(1)
    #     #find @stylist and make average of stars from @stylist.user_stylist where @stylist id and user_Stylist stylist_id matched.  and then make it float value and round from the first decimal place.
    # end

    # def hairstylist_rating
    #   UserStylist.find_by(stylist_id: self.id).stars
    # end

    #### scope method ####
    # Stylist.joins(:user_stylists).group('stylists.id').order('count(user_stylists.id) desc')


        #Most Reviewed Hairstylists!!
        # scope :most_reviews, -> {(joins(:user_stylists).group('stylists.id').order('count(user_stylists.id) desc', 'stylists.name ASC').limit(10)
          # select("stylists.name, stylists.id, count(user_stylists.id) as user_stylists_count")
          # .joins(:user_stylists)
          # .group("stylists.id")
          # .order("user_stylists_count DESC", "stylists.name ASC")
          # .limit(5)
        # )}
