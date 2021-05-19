class StylistsController < ApplicationController
  before_action :find_stylist, only: [:show]


  def index

      @stylists = Stylist.alpha_order_by_name ##all stylists' name in alphabetical order 
      # @stylists = Stylist.find_by_name('sa')     # << LIVE CODE PRACTICE : display stylist name starts with (a) #{}%
      # @stylists = Stylist.find_by_shop('am')     # << LIVE CODE PRACTICE : display shop name includes with (am) %#{}%
      # @most_reviews = Stylist.most_reviews       #<=== moved to page path
  end

  def show
  end



  def new
      @stylist = Stylist.new
  end
  def create
    # binding.pry
      @stylist = Stylist.new(stylist_params)
      # binding.pry
        
    if @stylist.save
      # binding.pry
        flash[:message] = "You've seccessfully created a new Hairstylist named #{@stylist.name.upcase}."
        redirect_to new_user_user_stylist_path(@user)
    else
        # flash[:message] = @stylist.errors.full_messages.join(", ")
        # binding.pry
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






  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

end




private 

def find_stylist
  @stylist= Stylist.find_by_id(params[:id])
end

def stylist_params
  #in our params, we wanna require who? (stylist!), and permit what? (attributes)
  params.require(:stylist).permit(:name, :phone, :shop_name, :address) 

end