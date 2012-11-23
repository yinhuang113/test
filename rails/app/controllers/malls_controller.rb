class MallsController < ApplicationController
  before_filter :authorize
  
  def index
    @malls = Mall.all
  end

  def new
    @mall = Mall.new
  end

  def create
  end

  def show
    @mall = Mall.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
