class StylistsController < ApplicationController
  before_action :find_stylist, only: [:show, :edit, :update]


  def index
      @stylists = Stylist.alphabetical_order 
      
    ############ Live Coding #################################
      if params[:query] && !params[:query].empty?
        @stylists = @stylists.search(params[:query].downcase)
      end
    ##########################################################
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
        flash[:message] = "You've successfully created a new Hairstylist named #{@stylist.name.upcase}."
        redirect_to new_user_user_stylist_path(@user) #directly send the user to the review page 
    else
        render :new
    end

  end



  def edit
  end


  def update

    if @stylist.update(stylist_edit_params)
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




# understand the challenge

# step 1 , don't code, pseudo code

# create a search bar on stylists homepage to search stylists by name ( partial string match )


# break it down into smaller steps (in order of request response)

    # 1. Where does the response originate? 
            # => Form on the stylists index page

    # 2. Create a route for the form to go to a controller action(index action or other action)
            # => index action 

    # 3. Write logic in controller ( or model) to filter by query
        #in stylist controller
          # => if params[:query] && !params[:query].empty?
          # =>   @stylists = @stylists.search(params[:query].downcase)
        #in stylist.rb   <=== where partial string match!!!!
          # def self.search(params)
          #   where("Lower(name) LIKE ? ", "%#{params}%")
          # end

    # 4. display results on index page or new view
         # boom on index page!!