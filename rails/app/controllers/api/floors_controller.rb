require "open3"

class Api::FloorsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    @mall = Mall.find(params[:mall_id])
    @floors = @mall.floors.order('"order" ASC')
  end

  def show
    @floor = Floor.find(params[:id])
  end
  
  def svg
    @floor = Floor.find(params[:id])
    
    if stale?(last_modified: @floor.updated_at.utc, etag: @floor.svg)
      headers["Content-Type"] = "image/svg+xml"
      render xml: @floor.svg
    end
  end

  def triangulation
    @floor = Floor.find(params[:id])
    
    polygons = ""
    @floor.polygons.each do |polygon|
      polygons << polygon.vertices + "\n"
    end
    polygons << "\n"
    
    headers["Content-Type"] = "text/plain"
    data, status = Open3.capture2("#{Rails.root.join('bin', 'triangulate')} 640 960 psql", stdin_data: polygons)
    render xml: data
  end
end
