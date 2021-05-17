class PagesController < ApplicationController

    def index 
        @most_reviews = Stylist.most_reviews
        @high_rated_hairstylists = UserStylist.stars_more_than(4) 
    end

end