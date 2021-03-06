class UserStylist < ApplicationRecord
    belongs_to :user
    belongs_to :stylist
    # belongs_to :stylist, optional: true


    validates_presence_of :haircut_date, :stars,:services, :price, :comment
    validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 2000 }
    validates :comment, length: { minimum: 2, maximum: 1000,
      too_short: "%{count} characters is the minimum allowed", 
      too_long: "%{count} characters is the maximum allowed" }
    
    # haircut_date custom validation  
    validate :haircut_date_cannot_be_in_the_future
      def haircut_date_cannot_be_in_the_future
        errors.add(:haircut_date, "can't be in the future") if
          !haircut_date.blank? and haircut_date > Date.today
      end



    ######### Recently High-Rated Reviews on PAGES#INDEX ################
    scope :stars_more_than, ->(amount) { 
      where('stars > ?', amount)
      .order(haircut_date: :desc)
      .limit(5)
    }


    #############Recent Haircut Reviews on PAGES#INDEX###################
    scope :recent_haircut_date_reviews, -> { 
      order(haircut_date: :desc) 
      .limit(5) 
      }


    #########order by haircut_date(desc) for user_stylist index  page #############
    scope :recent_haircut_date_order, -> { order(haircut_date: :desc) }

    def datetime
      self.haircut_date.strftime("%m/%d/%Y") if self.haircut_date
    end


end





 




# accepts_nested_attributes_for :stylist, :reject_if => proc { |attributes| attributes['name, phone, shop_name, address'].blank? }