require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { agreements_devices_cost: @company.agreements_devices_cost, agreements_devices_count: @company.agreements_devices_count, agreements_devices_price: @company.agreements_devices_price, agreements_endstart: @company.agreements_endstart, agreements_lastinvoiceamount: @company.agreements_lastinvoiceamount, agreements_startdate: @company.agreements_startdate, agrements_cycle: @company.agrements_cycle, agrements_terms: @company.agrements_terms, billing_contact_email: @company.billing_contact_email, billing_contact_fn: @company.billing_contact_fn, billing_contact_ln: @company.billing_contact_ln, billing_contact_phone: @company.billing_contact_phone, billing_contact_title: @company.billing_contact_title, billing_info_account_type: @company.billing_info_account_type, billing_info_approval_level: @company.billing_info_approval_level, billing_info_approver: @company.billing_info_approver, city: @company.city, contact_id: @company.contact_id, devices: @company.devices, fax: @company.fax, industry: @company.industry, invoices: @company.invoices, knowledgebase_articles: @company.knowledgebase_articles, name: @company.name, open_credit_invoices: @company.open_credit_invoices, open_invoices: @company.open_invoices, phone: @company.phone, primary_contact_fn: @company.primary_contact_fn, primary_contact_ln: @company.primary_contact_ln, s_afterhourscontactname: @company.s_afterhourscontactname, s_afterhourscontactphone: @company.s_afterhourscontactphone, s_city: @company.s_city, s_hours: @company.s_hours, s_map: @company.s_map, s_phone: @company.s_phone, s_round_trip_mileage: @company.s_round_trip_mileage, s_state: @company.s_state, s_street_add: @company.s_street_add, s_tolls: @company.s_tolls, sales_activities: @company.sales_activities, software_expiration: @company.software_expiration, software_licenses: @company.software_licenses, software_name: @company.software_name, state: @company.state, status: @company.status, street: @company.street, website: @company.website, zip: @company.zip }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    put :update, id: @company, company: { agreements_devices_cost: @company.agreements_devices_cost, agreements_devices_count: @company.agreements_devices_count, agreements_devices_price: @company.agreements_devices_price, agreements_endstart: @company.agreements_endstart, agreements_lastinvoiceamount: @company.agreements_lastinvoiceamount, agreements_startdate: @company.agreements_startdate, agrements_cycle: @company.agrements_cycle, agrements_terms: @company.agrements_terms, billing_contact_email: @company.billing_contact_email, billing_contact_fn: @company.billing_contact_fn, billing_contact_ln: @company.billing_contact_ln, billing_contact_phone: @company.billing_contact_phone, billing_contact_title: @company.billing_contact_title, billing_info_account_type: @company.billing_info_account_type, billing_info_approval_level: @company.billing_info_approval_level, billing_info_approver: @company.billing_info_approver, city: @company.city, contact_id: @company.contact_id, devices: @company.devices, fax: @company.fax, industry: @company.industry, invoices: @company.invoices, knowledgebase_articles: @company.knowledgebase_articles, name: @company.name, open_credit_invoices: @company.open_credit_invoices, open_invoices: @company.open_invoices, phone: @company.phone, primary_contact_fn: @company.primary_contact_fn, primary_contact_ln: @company.primary_contact_ln, s_afterhourscontactname: @company.s_afterhourscontactname, s_afterhourscontactphone: @company.s_afterhourscontactphone, s_city: @company.s_city, s_hours: @company.s_hours, s_map: @company.s_map, s_phone: @company.s_phone, s_round_trip_mileage: @company.s_round_trip_mileage, s_state: @company.s_state, s_street_add: @company.s_street_add, s_tolls: @company.s_tolls, sales_activities: @company.sales_activities, software_expiration: @company.software_expiration, software_licenses: @company.software_licenses, software_name: @company.software_name, state: @company.state, status: @company.status, street: @company.street, website: @company.website, zip: @company.zip }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
