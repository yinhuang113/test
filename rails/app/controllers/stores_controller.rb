class StoresController < ApplicationController
  before_filter :authorize

  def index
    @mall = Mall.find(params[:mall_id])
    @stores = @mall.stores
  end

  def new
    @mall = Mall.find(params[:mall_id])
    @store = @mall.stores.new
    @store.polygon = Polygon.new
  end

  def create
    @mall = Mall.find(params[:mall_id])
    @store = @mall.stores.new(params[:store])
    if @store.save
      flash[:success] = "Store created!"
      redirect_to mall_store_path(@mall, @store)
    else
      render 'new'
    end
  end

  def show
    @mall = Mall.find(params[:mall_id])
    @store = Store.find(params[:id])
  end

  def edit
    @mall = Mall.find(params[:mall_id])
    @store = Store.find(params[:id])
  end

  def update
    @mall = Mall.find(params[:mall_id])
    @store = Store.find(params[:id])
    if @store.update_attributes(params[:store])
      flash[:success] = "Store updated"
      redirect_to mall_store_path(@mall, @store)
    else
      render 'edit'
    end
  end

  def destroy
    Store.find(params[:id]).destroy
    flash[:success] = "Store destroyed."
    redirect_to stores_url
  end
end
