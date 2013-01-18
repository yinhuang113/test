class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  layout "profile"
    
  def index
       
  end
end
