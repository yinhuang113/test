require 'test_helper'

class KnowledgebasesControllerTest < ActionController::TestCase
  setup do
    @knowledgebasis = knowledgebases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knowledgebases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knowledgebasis" do
    assert_difference('Knowledgebase.count') do
      post :create, knowledgebasis: { author: @knowledgebasis.author, companies: @knowledgebasis.companies, date_created: @knowledgebasis.date_created, description: @knowledgebasis.description, edits: @knowledgebasis.edits, notes: @knowledgebasis.notes, product: @knowledgebasis.product, related_articles: @knowledgebasis.related_articles, related_devices: @knowledgebasis.related_devices, related_tickets: @knowledgebasis.related_tickets, screen_shots: @knowledgebasis.screen_shots, software: @knowledgebasis.software, topic: @knowledgebasis.topic, videos: @knowledgebasis.videos }
    end

    assert_redirected_to knowledgebasis_path(assigns(:knowledgebasis))
  end

  test "should show knowledgebasis" do
    get :show, id: @knowledgebasis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @knowledgebasis
    assert_response :success
  end

  test "should update knowledgebasis" do
    put :update, id: @knowledgebasis, knowledgebasis: { author: @knowledgebasis.author, companies: @knowledgebasis.companies, date_created: @knowledgebasis.date_created, description: @knowledgebasis.description, edits: @knowledgebasis.edits, notes: @knowledgebasis.notes, product: @knowledgebasis.product, related_articles: @knowledgebasis.related_articles, related_devices: @knowledgebasis.related_devices, related_tickets: @knowledgebasis.related_tickets, screen_shots: @knowledgebasis.screen_shots, software: @knowledgebasis.software, topic: @knowledgebasis.topic, videos: @knowledgebasis.videos }
    assert_redirected_to knowledgebasis_path(assigns(:knowledgebasis))
  end

  test "should destroy knowledgebasis" do
    assert_difference('Knowledgebase.count', -1) do
      delete :destroy, id: @knowledgebasis
    end

    assert_redirected_to knowledgebases_path
  end
end
