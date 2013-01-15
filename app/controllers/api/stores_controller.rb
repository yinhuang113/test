class Api::StoresController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    @mall = Mall.find(params[:mall_id])
    @stores = @mall.stores
  end

  def show
    @store = Store.find(params[:id])
  end
end
