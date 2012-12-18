class ConnectorsController < ApplicationController
  before_filter :authorize

  def index
    @mall = Mall.find(params[:mall_id])
    @connectors = @mall.connectors
  end

  def new
    @mall = Mall.find(params[:mall_id])
    @connector = @mall.connectors.new
    2.times { @connector.connector_locations.build }
  end

  def create
    @mall = Mall.find(params[:mall_id])
    @connector = @mall.connectors.new(params[:connector])
    if @connector.save
      flash[:success] = "Connector created!"
      redirect_to mall_connector_path(@mall, @connector)
    else
      render 'new'
    end
  end

  def show
    @mall = Mall.find(params[:mall_id])
    @connector = Connector.find(params[:id])
  end

  def edit
    @mall = Mall.find(params[:mall_id])
    @connector = Connector.find(params[:id])
  end

  def update
    @mall = Mall.find(params[:mall_id])
    @connector = Connector.find(params[:id])
    if @connector.update_attributes(params[:connector])
      flash[:success] = "Connector updated"
      redirect_to mall_connector_path(@mall, @connector)
    else
      render 'edit'
    end
  end

  def destroy
    Connector.find(params[:id]).destroy
    flash[:success] = "Connector destroyed."
    redirect_to mall_connectors_path(@mall)
  end
end
