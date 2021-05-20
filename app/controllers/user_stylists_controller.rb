class UserStylistsController < ApplicationController
    before_action :find_user_stylist#,  only: [:index, :show, :new, :create, :edit, :update, :destroy]

    def index 
        if params[:user_id]
            #order by haircut date
            @user_stylists = current_user.user_stylists.recent_haircut_date_order
        else
            @user_stylists = UserStylist.recent_haircut_date_order
            ### scope :stars_more_than   ==>  only 4 or 5 stars will be displayed ###
            # @high_rated_hairstylists = UserStylist.stars_more_than(4) #<=== moved to pages path
        end
    end

    
    def show
        # @user_stylist = UserStylist.find_by_id(params[:id])   <==before action! go!
        # binding.pry
        find_stylist_id_on_user_stylist  #need stylist id to show stylist name in user_stylist show
        # binding.pry
    end


    def new
        
        @user_stylist = current_user.user_stylists.build
        # @user_stylist.build_stylist
        # binding.pry
    end

    def create 
        # binding.pry
        # find_stylist_id_on_user_stylist
        @user_stylist = current_user.user_stylists.build(user_stylist_params)
        # if @user_stylist.stylist
        # if @user_stylist.stylist_id != nil
        if  @user_stylist.save
            flash[:message] = "Your review with hairstylist #{@user_stylist.stylist.name.upcase} has been created"
            redirect_to user_user_stylist_path(@user, @user_stylist)
            
        else
            # if @user_stylist.stylist_id == nil 
            #     flash[:message] = "please select hairstylist"
            # elsif 
            # else
            #     # binding.pry
            #     flash[:message] = @user_stylist.errors.full_messages.join(", ")
            # end
            # flash[:message] = @user_stylist.errors.full_messages.join(", ")
            # flash[:message] = @user_stylist.stylist.errors.full_messages.join(", ")
            render :new
        end
        

    end







    def edit
        # binding.pry
        if @user_stylist.user_id != current_user.id
            # binding.pry
            flash[:message] = " Something went wrong here. Please try again! "
            redirect_to root_path
        
        end
        # find_stylist_id_on_user_stylist
    end

    def update
        # binding.pry
        if @user_stylist.update(user_stylist_params)
            # binding.pry
        flash[:message] = "Your review has been updated! "
        redirect_to user_user_stylist_path(@user, @user_stylist)
        else
            # binding.pry
        # flash[:message] = @user_stylist.errors.full_messages.join(", ")
        render :edit

        end

        
    end

    def destroy
        # binding.pry
        @user_stylist.destroy
        flash[:message] = "Your review has been deleted! "
        redirect_to user_user_stylists_path(@user)
    end





    private


    def find_user_stylist
        @user_stylist= UserStylist.find_by_id(params[:id])
    end


    def find_stylist_id_on_user_stylist
        params[:stylist_id_on_user_stylist] = @user_stylist.stylist_id
        @stylist = Stylist.find_by_id(params[:stylist_id_on_user_stylist]) 
    end


    def user_stylist_params
        params.require(:user_stylist).permit(:haircut_date, :stars, :comment, 
            :services, :price, :user_id, :stylist_id)
    end 

    # def stylist_params
    #     params.require(:user_stylist).permit(stylists_attributes: [
    #         :name,
    #         :phone,
    #         :shop_name,
    #         :address])
    # end

end