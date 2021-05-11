class UserStylistsController < ApplicationController
    before_action :find_user_stylist,  only: [:index, :show, :edit, :update, :destroy]

    def index 
        # binding.pry
        if params[:user_id]
            @user_stylists = current_user.user_stylists 
        else
            @user_stylists = UserStylist.all
        end
    end

    def show
        # @user_stylist = UserStylist.find_by_id(params[:id])   <==before action! go!

       params[:stylist_id_on_user_stylist] = @user_stylist.stylist_id
       @stylist = Stylist.find_by_id(params[:stylist_id_on_user_stylist]) 
        # binding.pry

    end


    def new
        # @stylist = UserStylist.find(params[:id])
        # binding.pry
        @user_stylist = UserStylist.new
        # @user_stylist.stylists.build
        # @user.user_stylists.stylist.build
        # binding.pry
    end
    def create 
        
        @user_stylist = @user.user_stylists.build(user_stylist_params)
        
        # @user_stylist = current_user.user_stylists.build(user_stylist_params)
    # binding.pry
        # Can Only Save If Valid

        if @user_stylist.save
                # binding.pry  #  Final Check!! 👀
            redirect_to user_user_stylist_path(@user, @user_stylist)    #  /user/:id
        else
            render :new
        end

    end



    def edit
        params[:stylist_id_on_user_stylist] = @user_stylist.stylist_id
        @stylist = Stylist.find_by_id(params[:stylist_id_on_user_stylist]) 
    end
    def update
        @user_stylist.update(user_stylist_params)
        # binding.pry
        redirect_to user_user_stylist_path(@user, @user_stylist)

    end

    def destroy
        binding.pry
        @user_stylist.destroy
        redirect_to user_user_stylists_path(@user)
    end

    private


    def find_user_stylist
        @user_stylist= UserStylist.find_by_id(params[:id])
    end

    def user_stylist_params
        params.require(:user_stylist).permit(:haircut_date, :stars, :comment, 
            :services, :price, :user_id, :stylist_id)
    end 


end