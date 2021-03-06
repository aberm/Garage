class CarsController < ApplicationController

  def index
    @cars = Car.all
    render :index
  end

  def new
    @car = Car.new
    render :new
  end

  def create
    @car = Car.create(strong_params(:brand,:color,:model))
    redirect_to car_path(@car)
  end

  def show
    @car = Car.find(params[:id])
    render :show
  end

  def edit
    @car = Car.find(params[:id])
    render :edit
  end

  def update
    @car = Car.find(params[:id])
    @car.update(strong_params(:brand,:color,:model))
    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:id]).destroy
    redirect_to "/cars"
  end

  private

  def strong_params(*attributes)
    params.require(:car).permit(*attributes)
  end

end
