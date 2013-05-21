require 'test_helper'

class InventoriesControllerTest < ActionController::TestCase
  setup do
    @inventory = inventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory" do
    assert_difference('Inventory.count') do
      post :create, inventory: { manufacture: @inventory.manufacture, manufacture_part: @inventory.manufacture_part, product: @inventory.product, references_companies_who_own: @inventory.references_companies_who_own, references_purchase_orders: @inventory.references_purchase_orders, references_rmas: @inventory.references_rmas, references_sales_orders: @inventory.references_sales_orders, stock_location: @inventory.stock_location, stock_on_hand: @inventory.stock_on_hand, tax: @inventory.tax, type: @inventory.type, units: @inventory.units, vendor_other: @inventory.vendor_other, vendor_perferred: @inventory.vendor_perferred }
    end

    assert_redirected_to inventory_path(assigns(:inventory))
  end

  test "should show inventory" do
    get :show, id: @inventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory
    assert_response :success
  end

  test "should update inventory" do
    put :update, id: @inventory, inventory: { manufacture: @inventory.manufacture, manufacture_part: @inventory.manufacture_part, product: @inventory.product, references_companies_who_own: @inventory.references_companies_who_own, references_purchase_orders: @inventory.references_purchase_orders, references_rmas: @inventory.references_rmas, references_sales_orders: @inventory.references_sales_orders, stock_location: @inventory.stock_location, stock_on_hand: @inventory.stock_on_hand, tax: @inventory.tax, type: @inventory.type, units: @inventory.units, vendor_other: @inventory.vendor_other, vendor_perferred: @inventory.vendor_perferred }
    assert_redirected_to inventory_path(assigns(:inventory))
  end

  test "should destroy inventory" do
    assert_difference('Inventory.count', -1) do
      delete :destroy, id: @inventory
    end

    assert_redirected_to inventories_path
  end
end
