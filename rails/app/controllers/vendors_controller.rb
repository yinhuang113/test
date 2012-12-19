class VendorsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(params[:vendor])
    if @vendor.save
      flash[:success] = "Vendor created!"
      redirect_to @vendor
    else
      render 'new'
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update_attributes(params[:vendor])
      flash[:success] = "Vendor updated"
      redirect_to @vendor
    else
      render 'edit'
    end
  end

  def destroy
    Vendor.find(params[:id]).destroy
    flash[:success] = "Vendor destroyed."
    redirect_to vendors_url
  end
end
