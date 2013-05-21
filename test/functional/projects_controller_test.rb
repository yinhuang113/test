require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { account_manager: @project.account_manager, approver: @project.approver, billing_method_approver: @project.billing_method_approver, billing_method_terms: @project.billing_method_terms, budgeted_expenses: @project.budgeted_expenses, budgeted_hours: @project.budgeted_hours, company_id: @project.company_id, description: @project.description, documents: @project.documents, downpayment_info_amount: @project.downpayment_info_amount, downpayment_info_breakdown: @project.downpayment_info_breakdown, downpayment_info_datepaid: @project.downpayment_info_datepaid, downpayment_info_invoice: @project.downpayment_info_invoice, end_date: @project.end_date, expenses: @project.expenses, extension: @project.extension, invoices: @project.invoices, knowledgebase_articles: @project.knowledgebase_articles, notes: @project.notes, open_issues: @project.open_issues, phases: @project.phases, phone: @project.phone, phone_logs: @project.phone_logs, products_bin: @project.products_bin, products_cost: @project.products_cost, products_name: @project.products_name, products_price: @project.products_price, products_purchase_order: @project.products_purchase_order, project_manager: @project.project_manager, resources_name: @project.resources_name, resources_role: @project.resources_role, schedule: @project.schedule, site_city: @project.site_city, site_phone: @project.site_phone, site_zip: @project.site_zip, start_date: @project.start_date, status: @project.status, survery_results: @project.survery_results, tasks: @project.tasks, time_entry_completed: @project.time_entry_completed, time_entry_standard: @project.time_entry_standard, type: @project.type }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    put :update, id: @project, project: { account_manager: @project.account_manager, approver: @project.approver, billing_method_approver: @project.billing_method_approver, billing_method_terms: @project.billing_method_terms, budgeted_expenses: @project.budgeted_expenses, budgeted_hours: @project.budgeted_hours, company_id: @project.company_id, description: @project.description, documents: @project.documents, downpayment_info_amount: @project.downpayment_info_amount, downpayment_info_breakdown: @project.downpayment_info_breakdown, downpayment_info_datepaid: @project.downpayment_info_datepaid, downpayment_info_invoice: @project.downpayment_info_invoice, end_date: @project.end_date, expenses: @project.expenses, extension: @project.extension, invoices: @project.invoices, knowledgebase_articles: @project.knowledgebase_articles, notes: @project.notes, open_issues: @project.open_issues, phases: @project.phases, phone: @project.phone, phone_logs: @project.phone_logs, products_bin: @project.products_bin, products_cost: @project.products_cost, products_name: @project.products_name, products_price: @project.products_price, products_purchase_order: @project.products_purchase_order, project_manager: @project.project_manager, resources_name: @project.resources_name, resources_role: @project.resources_role, schedule: @project.schedule, site_city: @project.site_city, site_phone: @project.site_phone, site_zip: @project.site_zip, start_date: @project.start_date, status: @project.status, survery_results: @project.survery_results, tasks: @project.tasks, time_entry_completed: @project.time_entry_completed, time_entry_standard: @project.time_entry_standard, type: @project.type }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
