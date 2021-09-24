class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = find_restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    @restaurant = find_restaurant
  end

  def update
    @restaurant = find_restaurant
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = find_restaurant
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def find_restaurant
    Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :city, :star_rating, :cuisine)
  end
end
