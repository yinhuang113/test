class ProfilesController < ApplicationController
  before_filter :authenticate_user!
    
  def index
    @users = current_user.account.try(:users)
  end
end
