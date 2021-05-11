class Stylist < ApplicationRecord
    has_many :user_stylists
    has_many :users, through: :user_stylists

   

    # def categories_attributes=(category_attributes)
    #   category_attributes.values.each do |category_attribute|
    #     if category_attribute["name"].present?
    #       category = Category.find_or_create_by(category_attribute)
    #       self.categories << category
    #     end
    #   end
    # end


    #### scope method ####
    #hair stylist average rating#
    def average_rating
        UserStylist.where(stylist_id: self.id).average(:stars).to_i
      end

end
