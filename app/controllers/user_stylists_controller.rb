class UserStylistsController < ApplicationController
    before_action :find_user_stylist,  only: [:index, :show, :edit, :update, :destroy]

    def index 
        if params[:user_id]
            @user_stylists = current_user.user_stylists 
        else
            # binding.pry
            @user_stylists = UserStylist.all
            ### scope :stars_more_than   ==>  only 4 or 5 stars will be displayed ###
            @high_rated_hairstylists = UserStylist.stars_more_than(4) 
            # binding.pry
        end
    end

    
    def show
        # binding.pry
        # @user_stylist = UserStylist.find_by_id(params[:id])   <==before action! go!
# binding.pry
       params[:stylist_id_on_user_stylist] = @user_stylist.stylist_id
       @stylist = Stylist.find_by_id(params[:stylist_id_on_user_stylist]) 
        # binding.pry
    end


    def new
        # @stylist = UserStylist.find(params[:id])
        # binding.pry
        @user_stylist = @user.user_stylists.new

        params[:stylist_id_on_user_stylist] = @user_stylist.stylist_id
        @stylist = Stylist.find_by_id(params[:stylist_id_on_user_stylist]) 
        # binding.pry
        # @user_stylist.stylists.build
        # @user.user_stylists.stylist.build
        # binding.pry
    end
    def create 

        @user_stylist = @user.user_stylists.build(user_stylist_params)
                # binding.pry 
        # @user_stylist = current_user.user_stylists.build(user_stylist_params)
    # binding.pry
        # Can Only Save If Valid

        if @user_stylist.save
                # binding.pry  #  Final Check!! 👀
            flash[:message] = "Your review with hairstylist name #{@user_stylist.stylist.name.upcase} has been created! "
            redirect_to user_user_stylist_path(@user, @user_stylist) #  /user/:id
            
        else
            # binding.pry
            flash[:message] = @user_stylist.errors.full_messages.join(", ")
            redirect_to new_user_user_stylist_path(@user)
        end
        

    end



    def edit
        # binding.pry
        if @user_stylist.user_id != current_user.id
            redirect_to user_stylist_path(@user_stylist)
        end
            params[:stylist_id_on_user_stylist] = @user_stylist.stylist_id
            @stylist = Stylist.find_by_id(params[:stylist_id_on_user_stylist]) 
    end
    def update
        @user_stylist.update(user_stylist_params)
        # binding.pry
        flash[:message] = "Your review has been updated! "
        redirect_to user_user_stylist_path(@user, @user_stylist)
        
    end

    def destroy
        # binding.pry
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