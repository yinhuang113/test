require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post :create, ticket: { account_manager: @ticket.account_manager, agreement_project: @ticket.agreement_project, budgeted_hours: @ticket.budgeted_hours, company_id: @ticket.company_id, description: @ticket.description, despatcher: @ticket.despatcher, device: @ticket.device, documents: @ticket.documents, email: @ticket.email, expenses: @ticket.expenses, extension: @ticket.extension, knowledgebase_articles: @ticket.knowledgebase_articles, location: @ticket.location, notes: @ticket.notes, open_ticket_company_id: @ticket.open_ticket_company_id, open_ticket_user_id: @ticket.open_ticket_user_id, open_tickets_device: @ticket.open_tickets_device, phone: @ticket.phone, phone_logs: @ticket.phone_logs, priority_level: @ticket.priority_level, products_name: @ticket.products_name, products_price: @ticket.products_price, products_stocklevel: @ticket.products_stocklevel, resource: @ticket.resource, sales_task: @ticket.sales_task, schedule: @ticket.schedule, site_city: @ticket.site_city, site_phone: @ticket.site_phone, site_zip: @ticket.site_zip, source: @ticket.source, status: @ticket.status, survey_results: @ticket.survey_results, tasks: @ticket.tasks, time_entry_completed: @ticket.time_entry_completed, time_entry_standard: @ticket.time_entry_standard, type: @ticket.type, user_id: @ticket.user_id }
    end

    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should show ticket" do
    get :show, id: @ticket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticket
    assert_response :success
  end

  test "should update ticket" do
    put :update, id: @ticket, ticket: { account_manager: @ticket.account_manager, agreement_project: @ticket.agreement_project, budgeted_hours: @ticket.budgeted_hours, company_id: @ticket.company_id, description: @ticket.description, despatcher: @ticket.despatcher, device: @ticket.device, documents: @ticket.documents, email: @ticket.email, expenses: @ticket.expenses, extension: @ticket.extension, knowledgebase_articles: @ticket.knowledgebase_articles, location: @ticket.location, notes: @ticket.notes, open_ticket_company_id: @ticket.open_ticket_company_id, open_ticket_user_id: @ticket.open_ticket_user_id, open_tickets_device: @ticket.open_tickets_device, phone: @ticket.phone, phone_logs: @ticket.phone_logs, priority_level: @ticket.priority_level, products_name: @ticket.products_name, products_price: @ticket.products_price, products_stocklevel: @ticket.products_stocklevel, resource: @ticket.resource, sales_task: @ticket.sales_task, schedule: @ticket.schedule, site_city: @ticket.site_city, site_phone: @ticket.site_phone, site_zip: @ticket.site_zip, source: @ticket.source, status: @ticket.status, survey_results: @ticket.survey_results, tasks: @ticket.tasks, time_entry_completed: @ticket.time_entry_completed, time_entry_standard: @ticket.time_entry_standard, type: @ticket.type, user_id: @ticket.user_id }
    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete :destroy, id: @ticket
    end

    assert_redirected_to tickets_path
  end
end
