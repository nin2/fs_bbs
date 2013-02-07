require 'test_helper'

class CountryAreasControllerTest < ActionController::TestCase
  setup do
    @country_area = country_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:country_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country_area" do
    assert_difference('CountryArea.count') do
      post :create, country_area: { name: @country_area.name }
    end

    assert_redirected_to country_area_path(assigns(:country_area))
  end

  test "should show country_area" do
    get :show, id: @country_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @country_area
    assert_response :success
  end

  test "should update country_area" do
    put :update, id: @country_area, country_area: { name: @country_area.name }
    assert_redirected_to country_area_path(assigns(:country_area))
  end

  test "should destroy country_area" do
    assert_difference('CountryArea.count', -1) do
      delete :destroy, id: @country_area
    end

    assert_redirected_to country_areas_path
  end
end
