module ApplicationHelper
  def current_account
    current_user.try(:account)
  end

  def body_class
    %|l-#{current_layout} c-#{controller.controller_name} a-#{controller.action_name}|
  end

  def current_layout
    controller.send :_layout
  end
end
