require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post :create, invoice: { agreement_excluded: @invoice.agreement_excluded, agreement_included: @invoice.agreement_included, agreement_terms: @invoice.agreement_terms, billing_contact__fn: @invoice.billing_contact__fn, billing_contact_email: @invoice.billing_contact_email, billing_contact_ln: @invoice.billing_contact_ln, billing_contact_phone: @invoice.billing_contact_phone, billing_contact_title: @invoice.billing_contact_title, billing_info_account_type: @invoice.billing_info_account_type, billing_info_approval_level: @invoice.billing_info_approval_level, billing_info_approver: @invoice.billing_info_approver, charges_expenses: @invoice.charges_expenses, charges_products: @invoice.charges_products, charges_tax: @invoice.charges_tax, charges_time: @invoice.charges_time, commission_product: @invoice.commission_product, commission_service: @invoice.commission_service, company_name: @invoice.company_name, fax: @invoice.fax, invoice_due_date: @invoice.invoice_due_date, invoiced_purchase_order: @invoice.invoiced_purchase_order, invoiced_sales_order: @invoice.invoiced_sales_order, invoiced_ticket_number: @invoice.invoiced_ticket_number, open_credit_invoices: @invoice.open_credit_invoices, open_invoices: @invoice.open_invoices, phone: @invoice.phone, site_business_hours: @invoice.site_business_hours, site_city: @invoice.site_city, site_map: @invoice.site_map, site_phone: @invoice.site_phone, site_round_trip_mileage: @invoice.site_round_trip_mileage, site_state: @invoice.site_state, site_street_address: @invoice.site_street_address, site_tolls: @invoice.site_tolls, site_zip: @invoice.site_zip, status: @invoice.status }
    end

    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should show invoice" do
    get :show, id: @invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice
    assert_response :success
  end

  test "should update invoice" do
    put :update, id: @invoice, invoice: { agreement_excluded: @invoice.agreement_excluded, agreement_included: @invoice.agreement_included, agreement_terms: @invoice.agreement_terms, billing_contact__fn: @invoice.billing_contact__fn, billing_contact_email: @invoice.billing_contact_email, billing_contact_ln: @invoice.billing_contact_ln, billing_contact_phone: @invoice.billing_contact_phone, billing_contact_title: @invoice.billing_contact_title, billing_info_account_type: @invoice.billing_info_account_type, billing_info_approval_level: @invoice.billing_info_approval_level, billing_info_approver: @invoice.billing_info_approver, charges_expenses: @invoice.charges_expenses, charges_products: @invoice.charges_products, charges_tax: @invoice.charges_tax, charges_time: @invoice.charges_time, commission_product: @invoice.commission_product, commission_service: @invoice.commission_service, company_name: @invoice.company_name, fax: @invoice.fax, invoice_due_date: @invoice.invoice_due_date, invoiced_purchase_order: @invoice.invoiced_purchase_order, invoiced_sales_order: @invoice.invoiced_sales_order, invoiced_ticket_number: @invoice.invoiced_ticket_number, open_credit_invoices: @invoice.open_credit_invoices, open_invoices: @invoice.open_invoices, phone: @invoice.phone, site_business_hours: @invoice.site_business_hours, site_city: @invoice.site_city, site_map: @invoice.site_map, site_phone: @invoice.site_phone, site_round_trip_mileage: @invoice.site_round_trip_mileage, site_state: @invoice.site_state, site_street_address: @invoice.site_street_address, site_tolls: @invoice.site_tolls, site_zip: @invoice.site_zip, status: @invoice.status }
    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete :destroy, id: @invoice
    end

    assert_redirected_to invoices_path
  end
end
