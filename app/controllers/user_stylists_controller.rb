class UserStylistsController < ApplicationController
    before_action :find_user_stylist#,  only: [:index, :show, :new, :create, :edit, :update, :destroy]

    def index 
        if params[:user_id]
            #order by haircut date
            @user_stylists = current_user.user_stylists.recent_haircut_date_order
        else
            @user_stylists = UserStylist.recent_haircut_date_order
        end
    end

    
    def show
        find_stylist_id_on_user_stylist
    end


    def new
        
        @user_stylist = current_user.user_stylists.build
    end

    def create 
        @user_stylist = current_user.user_stylists.build(user_stylist_params)

        if  @user_stylist.save
            flash[:message] = "Your review with hairstylist #{@user_stylist.stylist.name.upcase} has been created"
            redirect_to user_user_stylist_path(@user, @user_stylist)
            
        else

            render :new
        end
        

    end







    def edit
        if @user_stylist.user_id != current_user.id

            flash[:message] = " Something went wrong here. Please try again! "
            redirect_to root_path
        
        end

    end

    def update
        if @user_stylist.update(user_stylist_params)

            flash[:message] = "Your review has been updated! "
            redirect_to user_user_stylist_path(@user, @user_stylist)
        else
            render :edit

        end

        
    end

    def destroy
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




end