class RacesController < ApplicationController
  def index
    @races = Race.all
  end

  def show
    @race = Race.find(params[:id])
  end

  def new
    @race = Race.new
  end

  def create
    race = Race.create( race_params )
    if race.save
      redirect_to races_path
    else
      render :new
    end
  end

  def edit
    @race = Race.find(params[:id])
  end

  def update
    race = Race.find(params[:id])
    race.update( race_params )
    redirect_to race_path( race )
  end

  def destroy
    race = Race.find(params[:id])
    race.destroy
    redirect_to races_path
  end

  private
    def race_params
      params.require(:race).permit(:name, :image, :homeworld, :description, :leader)
    end

end
