module ApplicationHelper
  def current_account
    current_user.try(:account)
  end

  def body_class
    %|c-#{controller.controller_name} a-#{controller.action_name}|
  end


end
