class StylistsController < ApplicationController
  before_action :find_stylist, only: [:show]


  def index

      @stylists = Stylist.all.order(created_at: :desc)
      # @stylists = Stylist.find_by_name('a')     # << LIVE CODE PRACTICE : Show only stylist name starts with (a)
      # @most_reviews = Stylist.most_reviews       #<=== moved to page path
      # @high_rated_hairstylists = Stylist.stars_more_than(3)
      # @more_than_4_stars = Stylist.more_than_4_stars
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
        flash[:message] = @stylist.errors.full_messages.join(", ")
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






  def edit
  end

  def update
  end

  def destroy
  end

end




private 

def find_stylist
  @stylist= Stylist.find_by_id(params[:id])
end

def stylist_params
  #in our params, we wanna require who? (stylist!), and permit what? (attributes)
  params.require(:stylist).permit(:name, :phone, :shop_name, :address) 

end