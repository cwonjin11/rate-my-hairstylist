class Stylist < ApplicationRecord
    has_many :user_stylists
    has_many :users, through: :user_stylists

   
    validates_presence_of :name, :phone, :shop_name, :address
    validates :phone, :presence => true, :phone => true
    
    ##### make upcase, downcase as the same name #####
    validates :name, uniqueness: { case_sensitive: false }
    validates_uniqueness_of :phone, :case_sensitive => false
  
  #################LIVE CODING #####################
    def self.search(params)
      where("Lower(name) LIKE ? ", "%#{params}%")
    end
  ###################################################










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

      
end


