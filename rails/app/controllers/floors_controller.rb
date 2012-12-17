class FloorsController < ApplicationController
  before_filter :authorize

  def index
    @mall = Mall.find(params[:mall_id])
    @floors = @mall.floors.order('"order" ASC')
  end

  def new
    @mall = Mall.find(params[:mall_id])
    @floor = @mall.floors.new
  end

  def create
    @floor = Floor.new(params[:floor])
    if @floor.save
      flash[:success] = "Floor created!"
      redirect_to @floor
    else
      render 'new'
    end
  end

  def show
    @floor = Floor.find(params[:id])
  end

  def edit
    @floor = Floor.find(params[:id])
  end

  def update
    @floor = Floor.find(params[:id])
    if @floor.update_attributes(params[:floor])
      flash[:success] = "Floor updated"
      redirect_to @floor
    else
      render 'edit'
    end
  end

  def destroy
    Floor.find(params[:id]).destroy
    flash[:success] = "Floor destroyed."
    redirect_to floors_url
  end
  
  def svg
    headers["Content-Type"] = "image/svg+xml"
    @floor = Floor.find(params[:id])
    render xml: @floor.svg
  end
end
