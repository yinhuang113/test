require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { company: @user.company, contact_id: @user.contact_id, email: @user.email, email_private: @user.email_private, extension: @user.extension, fax: @user.fax, firstName: @user.firstName, home_phone: @user.home_phone, lastName: @user.lastName, mobile: @user.mobile, notes: @user.notes, phone: @user.phone, site_city: @user.site_city, site_phone: @user.site_phone, site_zip: @user.site_zip, title: @user.title }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { company: @user.company, contact_id: @user.contact_id, email: @user.email, email_private: @user.email_private, extension: @user.extension, fax: @user.fax, firstName: @user.firstName, home_phone: @user.home_phone, lastName: @user.lastName, mobile: @user.mobile, notes: @user.notes, phone: @user.phone, site_city: @user.site_city, site_phone: @user.site_phone, site_zip: @user.site_zip, title: @user.title }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
