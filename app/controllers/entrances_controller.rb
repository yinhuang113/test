class EntrancesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @floor = Floor.find(params[:floor_id])
    @entrances = @floor.entrances
  end

  def new
    @floor = Floor.find(params[:floor_id])
    @entrance = @floor.entrances.new
  end

  def create
    @floor = Floor.find(params[:floor_id])
    @entrance = @floor.entrances.new(params[:entrance])
    if @entrance.save
      flash[:success] = "Entrance created!"
      redirect_to mall_floor_entrance_path(@floor.mall, @floor, @entrance)
    else
      render 'new'
    end
  end

  def show
    @floor = Floor.find(params[:floor_id])
    @entrance = Entrance.find(params[:id])
  end

  def edit
    @floor = Floor.find(params[:floor_id])
    @entrance = Entrance.find(params[:id])
  end

  def update
    @floor = Floor.find(params[:floor_id])
    @entrance = Entrance.find(params[:id])
    if @entrance.update_attributes(params[:entrance])
      flash[:success] = "Entrance updated"
      redirect_to mall_floor_entrance_path(@floor.mall, @floor, @entrance)
    else
      render 'edit'
    end
  end

  def destroy
    Entrance.find(params[:id]).destroy
    flash[:success] = "Entrance destroyed."
    redirect_to mall_floor_entrances_path(@floor.mall, @floor)
  end
end
