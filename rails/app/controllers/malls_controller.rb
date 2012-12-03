class MallsController < ApplicationController
  before_filter :authorize
  
  def index
    @malls = Mall.all
  end

  def new
    @mall = Mall.new
  end

  def create
    @mall = Mall.new(params[:mall])
    if @mall.save
      flash[:success] = "Mall created!"
      redirect_to @mall
    else
      render 'new'
    end
  end

  def show
    @mall = Mall.find(params[:id])
  end

  def edit
    @mall = Mall.find(params[:id])
  end

  def update
    @mall = Mall.find(params[:id])
    if @mall.update_attributes(params[:mall])
      flash[:success] = "Mall updated"
      redirect_to @mall
    else
      render 'edit'
    end
  end

  def destroy
    Mall.find(params[:id]).destroy
    flash[:success] = "Mall destroyed."
    redirect_to malls_url
  end
end
