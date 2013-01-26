class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  layout "profile"
    
  def index
    @users = current_user.account.try(:users)
  end
end
