class UserStylist < ApplicationRecord
  belongs_to :user
  belongs_to :stylist
  # belongs_to :stylist, optional: true


  validates_presence_of :haircut_date, :stars, :comment, :services, :price
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
  
  # accepts_nested_attributes_for :stylist, :reject_if => proc { |attributes| attributes['name, phone, shop_name, address'].blank? }
  # accepts_nested_attributes_for :stylist


  ######### argument added in the controller for 5 stars! ################
  scope :stars_more_than, ->(amount) { where('stars > ?', amount)
                                        .order(haircut_date: :desc)
                                        .limit(5)
                                      }

  end
