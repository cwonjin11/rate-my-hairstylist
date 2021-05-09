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
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
