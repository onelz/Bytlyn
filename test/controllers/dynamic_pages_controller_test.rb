require 'test_helper'

class DynamicPagesControllerTest < ActionController::TestCase
  setup do
    @user1 = User.create(name: "test1", email: "test1@gmail.com", password: "foobar11", password_confirmation: "foobar11",
          rest: false)
    @cust = Customer.create(user_id: @user1.id, phone_number: 00000)
    @user1.save
    @cust.save
  end
  

  test "profile" do
    get :profile
    assert_redirected_to sign_in_path

  end

  test "index" do
    get :index
    assert_template "index"
  end

  test "signup" do
    get :signup
    assert_template "signup"
  end

  test "home" do
    get :index
    assert_template "index"
  end


end
