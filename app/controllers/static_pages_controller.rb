class StaticPagesController < ApplicationController
  before_filter :login   
  def home
  end

  def help
  end
  
  def login
    redirect_to '/admin/login' 
  end
end
