class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to gardens_path, notice: "ДС №#{@garden.number} успішно доданий в базу."
    else
      render 'new'
    end
  end

  private

  def garden_params
    params.permit(:number, :name, :director, :address, :phone )
  end
end
