class StylistsController < ApplicationController
  def index
    # binding.pry
      @stylists = Stylist.all
  end
  def show
    # binding.pry
      @stylist = Stylist.find_by_id(params[:id])
  end



  def new
      @stylist = Stylist.new
  end
  def create
      @stylist = @user.stylists.build(stylist_params)
      binding.pry
        
    if @stylist.save
      binding.pry
        redirect_to new_user_user_stylist_path(@user)
    else
        render :new
    end

  end

#   @wine = Wine.find_or_create_by(wine_params)
#   @wine.creator_id = current_user.id
#  if @wine.valid?
#    @wine.name = @wine.full_name
#    @wine.save
#    redirect_to @wine
#  else
#    render :new
#  end






  def edit
  end

  def update
  end

  def destroy
  end
end




private 

def stylist_params
  #in our params, we wanna require who? (stylist!), and permit what? (attributes)
  params.require(:stylist).permit(:name, :phone, :shop_name, :address) 

end