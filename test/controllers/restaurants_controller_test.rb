##################################################################################
# Test user_id must be integer -- done
# Test address must be string -- done
# Test hours must be string -- done
# Test no restaurant -- done
# Test no picture -- not sure if necessary?
# Test no ratings -- not yet implemented
# Test waitlist button -- unit test see restaurant_test.rb
# Test rating button -- not yet implemented
# Test Open now! -- not yet implemented
# Test Price level -- may be too difficult? Sol: all price in integer

require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = Restaurant.create("description"=>"123", "price"=>"123", "address"=>"123", "rest_type"=>"Italian", "zip" =>"94704", "city" =>"berkeley", "hours_attributes"=>{"0"=>{"open"=>"11:11", "close"=>"11:11", "rest_id"=>"90", "day_id"=>"1"}, "1"=>{"open"=>"14:22", "close"=>"14:22", "rest_id"=>"90", "day_id"=>"2"}, "2"=>{"open"=>"15:32", "close"=>"15:33", "rest_id"=>"90", "day_id"=>"3"}, "3"=>{"open"=>"03:22", "close"=>"15:32", "rest_id"=>"90", "day_id"=>"4"}, "4"=>{"open"=>"16:44", "close"=>"21:09", "rest_id"=>"90", "day_id"=>"5"}, "5"=>{"open"=>"18:06", "close"=>"19:07", "rest_id"=>"90", "day_id"=>"6"}, "6"=>{"open"=>"08:08", "close"=>"20:08", "rest_id"=>"90", "day_id"=>"7"}}, "user_id"=>"90")
    assert_response :success
    # assert @restaurant.save
    @user = User.create(id: 1, name: 'rest 1', email: 'FendyOnel@gmail.com', rest: true, password: '123123123', password_confirmation: '123123123')
    assert_response :success
    # assert @user.save
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  # test "should get new" do
  #   # post :create, user: { email: "abc@gmail.com", encrypted_password: "abcd", reset_password_token: "abcd", reset_password_sent_at: "2015-10-09", remember_created_at: "2015-10-09", current_sign_in_at: "2015-10-10", last_sign_in_at: "2015-10-10", current_sign_in_ip: "192.168.1.5", last_sign_in_ip: "192.168.1.9", name: "FendyOnel", rest: true }
  #   sign_in @user
  #   assert_response :success
  #   # assert_redirected_to restaurant_new_path
  #   assert_template "new"
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
        post :create, restaurant: { "description"=>"123", "price"=>"123", "address"=>"123", "city" => "Berkeley", "zip" => "94704",  "rest_type"=>"Italian", "hours_attributes"=>{"0"=>{"open"=>"11:11", "close"=>"11:11", "rest_id"=>"34", "day_id"=>"1"}, "1"=>{"open"=>"14:22", "close"=>"14:22", "rest_id"=>"34", "day_id"=>"1"}, "2"=>{"open"=>"15:32", "close"=>"15:33", "rest_id"=>"34", "day_id"=>"1"}, "3"=>{"open"=>"03:22", "close"=>"15:32", "rest_id"=>"34", "day_id"=>"1"}, "4"=>{"open"=>"16:44", "close"=>"21:09", "rest_id"=>"34", "day_id"=>"1"}, "5"=>{"open"=>"18:06", "close"=>"19:07", "rest_id"=>"34", "day_id"=>"1"}, "6"=>{"open"=>"08:08", "close"=>"20:08", "rest_id"=>"34", "day_id"=>"1"}}, "user_id"=>"34"}
    end
    assert_redirected_to profile_path
  end

  test "should show restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { "description"=>"123", "price"=>"123", "address"=>"123", "city" => "Berkeley", "zip" => "94704","rest_type"=>"Italian", "hours_attributes"=>{"0"=>{"open"=>"11:11", "close"=>"11:11", "rest_id"=>"17", "day_id"=>"1"}, "1"=>{"open"=>"14:22", "close"=>"14:22", "rest_id"=>"17", "day_id"=>"2"}, "2"=>{"open"=>"15:32", "close"=>"15:33", "rest_id"=>"17", "day_id"=>"3"}, "3"=>{"open"=>"03:22", "close"=>"15:32", "rest_id"=>"17", "day_id"=>"4"}, "4"=>{"open"=>"16:44", "close"=>"21:09", "rest_id"=>"17", "day_id"=>"5"}, "5"=>{"open"=>"18:06", "close"=>"19:07", "rest_id"=>"17", "day_id"=>"6"}, "6"=>{"open"=>"08:08", "close"=>"20:08", "rest_id"=>"17", "day_id"=>"7"}}, "user_id"=>"17"}
    end
    get :show, id: @restaurant.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant.id
    assert_response :success
  end

  test "should update restaurant" do
    patch :update, id: @restaurant.id, restaurant: {description: "MLK1"}
    @restaurant = Restaurant.where(user_id: 90).first
    assert_redirected_to restaurant_path(assigns(:restaurant))
    assert_equal(@restaurant["description"], "MLK1")

    patch :update, id: @restaurant.id, restaurant: {price: "2"}
    @restaurant = Restaurant.where(user_id: 90).first
    assert_redirected_to restaurant_path(assigns(:restaurant))
    assert_equal(@restaurant["price"], 2)

    patch :update, id: @restaurant.id, restaurant: {rest_type: "Mexican"}
    @restaurant = Restaurant.where(user_id: 90).first
    assert_redirected_to restaurant_path(assigns(:restaurant))
    assert_equal(@restaurant["rest_type"], "Mexican")

    patch :update, id: @restaurant.id, restaurant: {city: "Mexico"}
    @restaurant = Restaurant.where(user_id: 90).first
    assert_redirected_to restaurant_path(assigns(:restaurant))
    assert_equal(@restaurant["city"], "Mexico")

    patch :update, id: @restaurant.id, restaurant: {zip: "92020"}
    @restaurant = Restaurant.where(user_id: 90).first
    assert_redirected_to restaurant_path(assigns(:restaurant))
    assert_equal(@restaurant["zip"], "92020")

  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant.id
    end

    assert_redirected_to restaurants_path
  end

  # test "user_id is integer" do
  #   # print(@restaurant.user_id)
  #   # print(@customer.phone_number)
  #   # print(Restaurant.address)
  #   # print(Time.now.strftime("%I:%M%p"))
  #   assert_not_same("1", @restaurant.user_id, "user_id must be integer")
  # end

  # test "address is string" do
  #   assert_not_same(1893, @restaurant.address, "address must be string")
  # end

  # test "hours is string" do
  #   assert_not_same(9, @restaurant.hours, "hours must be string")
  # end


  # test "no restaurant count" do
  #   # Restaurant.new(user_id: 1, address: "1893 Berkeley Avenue", hours: "9:00 am - 10:00 pm") # create @restaurant instance
  #   # assert_not_nil assigns(:restaurant) # makes sure that a @restaurant instance variable was set
  #   # assert_difference(@restaurant.count, 1, "wrong")
  #   # assert_empty(0, 'Restaurant.count', "no restaurant found")
  #   @count = Restaurant.count
  #   assert_not_nil(@count, "No Restaurant found")
  # end
end



























