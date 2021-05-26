class StylistsController < ApplicationController
  before_action :find_stylist, only: [:show, :edit, :update]


  def index
      @stylists = Stylist.alphabetical_order 
  
  end

  def show
      if @stylist == nil
        redirect_to stylists_path
      end
  end



  def new
      @stylist = Stylist.new
  end


  def create
      @stylist = Stylist.new(stylist_params)

    if @stylist.save
        flash[:message] = "You've seccessfully created a new Hairstylist named #{@stylist.name.upcase}."
        redirect_to new_user_user_stylist_path(@user)
    else
        render :new
    end

  end



  def edit
  end


  def update
    # binding.pry
    if @stylist.update(stylist_edit_params)
      # binding.pry
      flash[:message] = "Successfully Updated! "
      redirect_to stylist_path(@stylist)
    else
      render :edit
    end
  end






  private 

    def find_stylist
      @stylist= Stylist.find_by_id(params[:id])
    end

    def stylist_params
      params.require(:stylist).permit(:name, :phone, :shop_name, :address) 
    end

    def stylist_edit_params
      params.require(:stylist).permit(:phone, :shop_name, :address)
    end

end
