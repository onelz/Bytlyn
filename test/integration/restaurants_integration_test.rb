require 'test_helper'
 
class RestaurantIntegrationTest < ActionDispatch::IntegrationTest
  setup do
   @restaurant = Restaurant.new(user_id: 3, address: '1892 Berkeley Avenue')
   @restaurant.save
   @user = User.new(id: 3, name: 'FendyOnel', email: 'FendyOnel@gmail.com', rest: true, password: '123123123', password_confirmation: '123123123')
   @user.save
 end

  test "login waitlist restaurant already sign up" do
    https?
    get "/restaurants"
    assert_response :success

    post_via_redirect create_user_path, 'user[name]' => 'FendyOnel2', 'user[email]' => 'FendyOnel2@gmail.com', 'user[password]' => '123123123', 'user[password_confirmation]' => '123123123'
    assert_equal '/profile', path
    delete destroy_user_session_path
    delete destroy_user_path

    post user_session_path, 'user[email]' => 'FendyOnel2@gmail.com', 'user[password]' => '123123123'
    get_via_redirect "/waitlists_new?rest_id=@user.id"
    assert_equal '/waitlists_new', path

    #tear down
    delete destroy_user_session_path
    delete destroy_user_path
  end

   test "login waitlist restaurant not yet sign in" do
    https!
    get "/restaurants"
    assert_response :success

    delete destroy_user_session_path
    get_via_redirect waitlists_path
    assert_equal '/login', path
   end

  test "create new restaurant" do
    https!
    get "/restaurants"
    assert_response :success

    #create user test
    assert_difference('Restaurant.count', 1) do
      post_via_redirect create_restaurant_path, 'user[name]' => 'FendyBilly', 'user[email]' => 'FendyBilly@gmail.com', 'user[password]' => '123123123', 'user[password_confirmation]' => '123123123'
      assert_equal '/restaurant_new', path
      @id = User.find_by_email('fendybilly@gmail.com').id
      post_via_redirect '/restaurants', 'restaurant' => {"description"=>"123", "price"=>"123", "address"=>"123", "city" => "Berkeley", "zip" => "94704","rest_type"=>"Italian", "hours_attributes"=>{"0"=>{"open"=>"11:11", "close"=>"11:11", "rest_id"=>@id, "day_id"=>"1"}, "1"=>{"open"=>"14:22", "close"=>"14:22", "rest_id"=>@id, "day_id"=>"2"}, "2"=>{"open"=>"15:32", "close"=>"15:33", "rest_id"=>@id, "day_id"=>"3"}, "3"=>{"open"=>"03:22", "close"=>"15:32", "rest_id"=>@id, "day_id"=>"4"}, "4"=>{"open"=>"16:44", "close"=>"21:09", "rest_id"=>@id, "day_id"=>"5"}, "5"=>{"open"=>"18:06", "close"=>"19:07", "rest_id"=>@id, "day_id"=>"6"}, "6"=>{"open"=>"08:08", "close"=>"20:08", "rest_id"=>@id, "day_id"=>"7"}}, "user_id"=>@id}
      assert_equal '/profile', path
    end
    #sign in test
    post_via_redirect user_session_path, 'user[email]' => 'FendyBilly@gmail.com', 'user[password]' => '123123123'
    assert_equal '/profile', path

    #tear down
    delete destroy_user_session_path
    delete destroy_user_path
   end

  test "count how many restaurants" do
    #create user test
    assert_difference('Restaurant.count', 1) do
        post_via_redirect create_restaurant_path, 'user[name]' => 'FendyBilly', 'user[email]' => 'FendyBilly@gmail.com', 'user[password]' => '123123123', 'user[password_confirmation]' => '123123123'
        assert_equal '/restaurant_new', path
        @id = User.find_by_email('fendybilly@gmail.com').id
        post_via_redirect '/restaurants', 'restaurant' => {"description"=>"123", "price"=>"123", "address"=>"123", "rest_type"=>"Italian", "city" => "Berkeley", "zip" => "94704","hours_attributes"=>{"0"=>{"open"=>"11:11", "close"=>"11:11", "rest_id"=>@id, "day_id"=>"1"}, "1"=>{"open"=>"14:22", "close"=>"14:22", "rest_id"=>@id, "day_id"=>"2"}, "2"=>{"open"=>"15:32", "close"=>"15:33", "rest_id"=>@id, "day_id"=>"3"}, "3"=>{"open"=>"03:22", "close"=>"15:32", "rest_id"=>@id, "day_id"=>"4"}, "4"=>{"open"=>"16:44", "close"=>"21:09", "rest_id"=>@id, "day_id"=>"5"}, "5"=>{"open"=>"18:06", "close"=>"19:07", "rest_id"=>@id, "day_id"=>"6"}, "6"=>{"open"=>"08:08", "close"=>"20:08", "rest_id"=>@id, "day_id"=>"7"}}, "user_id"=>@id}
        assert_equal '/profile', path
    end

    #tear down
    delete destroy_user_session_path
    delete destroy_user_path
   end

  test "stuck in setting if not yet filled" do
    post_via_redirect create_restaurant_path, 'user[name]' => 'FendyBilly', 'user[email]' => 'FendyBilly@gmail.com', 'user[password]' => '123123123', 'user[password_confirmation]' => '123123123'
      assert_equal '/restaurant_new', path
    get "/profile"
      assert_redirected_to restaurant_new_path
    get "/payment"
      assert_redirected_to restaurant_new_path
    get "/menus"
      assert_redirected_to restaurant_new_path
  end

end