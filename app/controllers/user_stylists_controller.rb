class UserStylistsController < ApplicationController
    before_action :find_user_stylist,  only: [:show]

    def index 
        @user_stylists = current_user.user_stylists

        # binding.pry
        # params[:stylist_id_on_user_stylist] = @user_stylist.stylist_id
        # @stylist = Stylist.find_by_id(params[:stylist_id_on_user_stylist])
        # binding.pry

    end
    def show
        # @user_stylist = UserStylist.find_by_id(params[:id])   <==before action! go!

        params[:stylist_id_on_user_stylist] = @user_stylist.stylist_id
        @stylist = Stylist.find_by_id(params[:stylist_id_on_user_stylist])
        # binding.pry

    end


    def new
        @user_hobby = UserHobby.new
    end
    def create 

    end



    private


    def find_user_stylist
        @user_stylist= UserStylist.find_by_id(params[:id])
    end

    def user_stylist_params
        params.require(:user_stylist).permit!
    end 


end