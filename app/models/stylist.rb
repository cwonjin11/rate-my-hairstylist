class Stylist < ApplicationRecord
    has_many :user_stylists
    has_many :users, through: :user_stylists

   
    validates_presence_of :name, :phone, :shop_name, :address
    validates_uniqueness_of :name, :phone

    

    #### scope method ####
    #hair stylist average rating#
    def average_rating
        UserStylist.where(stylist_id: self.id).average(:stars).to_f.round(1)
    end

    def hairstylist_rating
      UserStylist.find_by(stylist_id: self.id).stars
    end


    scope :most_reviews, -> {(
      select("stylists.name, stylists.id, count(user_stylists.id) as user_stylists_count")
      .joins(:user_stylists)
      .group("stylists.id")
      .order("user_stylists_count DESC")
      .limit(5)
    )}


    # scope :stars_more_than, ->(amount) {
    #   select("stylists.name, stylists.id, average(user_stylists.stars) as stylists_average_rating")
    #   .joins(:user_stylists)
    #   where("stylists_average_rating> ? ", amount)
    #   .group("stylists.id")
    #   .order("stylists_average_rating DESC")
    #   .limit(5)
    # }

    # joins(:user_stylists)
    # .group("stylists.id")

    # scope :high_rated, -> {(
      # select("stylists.name, stylists.id, count(user_stylists.stars) as user_stylists_stars")
      # .joins(:user_stylists)
      # .group("stylists.id")
      # .order("user_stylists_stars DEC")
      # .limit(5)
      # )}

      # scope :stars_more_than, ->(amount) { where("price > ?", amount) }

end
