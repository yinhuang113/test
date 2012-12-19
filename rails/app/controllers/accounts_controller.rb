class AccountsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])
    if @account.save
      flash[:success] = "Account created!"
      redirect_to @account
    else
      render 'new'
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      flash[:success] = "Account updated"
      redirect_to @account
    else
      render 'edit'
    end
  end

  def destroy
    Account.find(params[:id]).destroy
    flash[:success] = "Account destroyed."
    redirect_to accounts_url
  end
end
