class UserStylistsController < ApplicationController


    def index 
        @user_stylists = current_user.user_stylists
        # binding.pry
    end
    def show
        # have access to @user_hobby
        @user_stylist = UserStylist.find_by_id(params[:id])
    end
end