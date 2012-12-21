class Api::MallsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  
  def index
    @malls = Mall.all
  end

  def show
    @mall = Mall.find(params[:id])
    @schedule = Schedule.current(@mall)
  end
end
