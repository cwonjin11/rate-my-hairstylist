class UserStylist < ApplicationRecord
  belongs_to :user
  belongs_to :stylist
  # belongs_to :stylist, optional: true


  validates_presence_of :haircut_date, :stars, :price, :services, :comment
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 2000 }
  validates :comment, length: { minimum: 2, maximum: 500,
    too_short: "%{count} characters is the minimum allowed", 
    too_long: "%{count} characters is the maximum allowed" }

  # accepts_nested_attributes_for :stylist, :reject_if => proc { |attributes| attributes['name, phone, shop_name, address'].blank? }
  # accepts_nested_attributes_for :stylist


  ######### argument added in the controller for 5 stars! ################
  scope :stars_more_than, ->(amount) { 
    where('stars > ?', amount)
    .order(haircut_date: :desc)
    .limit(5)
  }

#############order by haircut_date(desc) on pages route ###################
  scope :recent_haircut_date_reviews, -> { 
    order(haircut_date: :desc) 
    .limit(5) 
  }

  #############order by haircut_date(desc) for index ###################
  scope :recent_haircut_date_order, -> { order(haircut_date: :desc) }

  

end


#Stylist.joins(:user_stylists)  <=== 