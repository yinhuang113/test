class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @account = Account.find(params[:account_id]) if params[:account_id]
    if @account
      @users = User.by_account(@account)
    else
      @users = User.all
    end
  end
  
  def new
    @user = User.new
    @user.account_id = params[:account_id]
  end
  
  def create
    @user = User.new(params[:user])
    @user.account_id = params[:account_id] if params[:account_id]
    if @user.save
      flash[:success] = "User created."
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_without_password(params[:user])
      flash[:success] = "User updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
end
