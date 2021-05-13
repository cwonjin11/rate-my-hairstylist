class UserStylist < ApplicationRecord
  belongs_to :user
  belongs_to :stylist


  validates_presence_of :haircut_date, :stars, :comment, :services, :price

  # accepts_nested_attributes_for :stylist
  accepts_nested_attributes_for :stylist

  scope :stars_more_than, ->(amount) { where('stars > ?', amount)
                                      .order(haircut_date: :desc)
                                      .limit(5)
                                    }
    



  # products.sort_by { |product| product.created_at }.reverse



end
