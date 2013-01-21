class MallsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @account = Account.find(params[:account_id]) if params[:account_id]
    if @account
      @malls = Mall.by_account(@account).paginate(:page => params[:page])
    else
      @malls = Mall.paginate(:page => params[:page])
    end
  end

  def new
    @mall = Mall.new
    @mall.account_id = params[:account_id]
  end

  def create
    @mall = Mall.new(params[:mall])
    @mall.account_id = params[:account_id] if params[:account_id]
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
  
  def venu
    @account = Account.find(params[:account_id]) if params[:account_id]
    if @account
      @malls = Mall.by_account(@account).paginate(:page => params[:page])
    else
      @malls = Mall.paginate(:page => params[:page])
    end
  end
  def mapbuilder
    @title = 'SYNERGY MEDIA CORP'
    render :layout => 'mapbuilder'
  end
end
