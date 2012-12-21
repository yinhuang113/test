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
end
