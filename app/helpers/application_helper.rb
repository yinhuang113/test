module ApplicationHelper
  def current_account
    current_user.try(:account)
  end
end
