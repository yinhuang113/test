class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:request_access]
  load_and_authorize_resource
  skip_authorize_resource only: :request_access

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
    if params[:user][:password]
      updated = @user.update_attributes(params[:user])
    else
      updated = @user.update_without_password(params[:user])
    end
    
    if updated
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
  
  def request_access
    SignUpMailer.signup(params).deliver
    flash[:success] = "Access request sent. You will be notified when you can access MapBuilder."
    redirect_to new_user_session_path
  end
end
