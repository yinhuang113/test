class ZonesController < ApplicationController
  before_filter :authorize

  def index
    @mall = Mall.find(params[:mall_id])
    @zones = @mall.zones
  end

  def new
    @mall = Mall.find(params[:mall_id])
    @zone = @mall.zones.new
    @zone.polygon = Polygon.new
  end

  def create
    @mall = Mall.find(params[:mall_id])
    @zone = @mall.zones.new(params[:zone])
    if @zone.save
      flash[:success] = "Zone created!"
      redirect_to mall_zone_path(@mall, @zone)
    else
      render 'new'
    end
  end

  def show
    @mall = Mall.find(params[:mall_id])
    @zone = Zone.find(params[:id])
  end

  def edit
    @mall = Mall.find(params[:mall_id])
    @zone = Zone.find(params[:id])
  end

  def update
    @mall = Mall.find(params[:mall_id])
    @zone = Zone.find(params[:id])
    if @zone.update_attributes(params[:zone])
      flash[:success] = "Zone updated"
      redirect_to mall_zone_path(@mall, @zone)
    else
      render 'edit'
    end
  end

  def destroy
    Zone.find(params[:id]).destroy
    flash[:success] = "Zone destroyed."
    redirect_to zones_url
  end
end
