require "open3"

class FloorsController < ApplicationController
  before_filter :authenticate_user!

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
    @mall = Mall.find(params[:mall_id])
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
    @floor = Floor.find(params[:id])
    headers["Content-Type"] = "image/svg+xml"
    render xml: @floor.svg
  end
  
  def triangulation
    @floor = Floor.find(params[:id])
    polygons = ""
    @floor.polygons.each do |polygon|
      polygons << polygon.vertices + "\n"
    end
    polygons << "\n\x04"
    
    headers["Content-Type"] = "image/svg+xml"
    data, status = Open3.capture2("#{Rails.root.join('bin', 'triangulate')} 640 960 svg", stdin_data: polygons)
    render xml: data
  end
end
