require 'test_helper'
# require File.dirname(__FILE__) + '/../test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :restaurants

  def test_user_id

    rest =   Restaurant.new "description"=>"123", "price"=>"123", "address"=>"123", "rest_type"=>"Italian", "hours_attributes"=>{"0"=>{"open"=>"11:11", "close"=>"11:11", "rest_id"=>"34", "day_id"=>"1"}, "1"=>{"open"=>"14:22", "close"=>"14:22", "rest_id"=>"34", "day_id"=>"1"}, "2"=>{"open"=>"15:32", "close"=>"15:33", "rest_id"=>"34", "day_id"=>"1"}, "3"=>{"open"=>"03:22", "close"=>"15:32", "rest_id"=>"34", "day_id"=>"1"}, "4"=>{"open"=>"16:44", "close"=>"21:09", "rest_id"=>"34", "day_id"=>"1"}, "5"=>{"open"=>"18:06", "close"=>"19:07", "rest_id"=>"34", "day_id"=>"1"}, "6"=>{"open"=>"08:08", "close"=>"20:08", "rest_id"=>"34", "day_id"=>"1"}}, "user_id"=>"34"
    assert rest.save

    rest_copy = Restaurant.find(rest.id)

    assert_equal rest.user_id, rest_copy.user_id

    # rest.user_id = 34

    # assert rest.save
    # assert rest.destroy
  end

  def test_address

    rest =   Restaurant.new "description"=>"123", "price"=>"123", "address"=>"123", "rest_type"=>"Italian", "hours_attributes"=>{"0"=>{"open"=>"11:11", "close"=>"11:11", "rest_id"=>"34", "day_id"=>"1"}, "1"=>{"open"=>"14:22", "close"=>"14:22", "rest_id"=>"34", "day_id"=>"1"}, "2"=>{"open"=>"15:32", "close"=>"15:33", "rest_id"=>"34", "day_id"=>"1"}, "3"=>{"open"=>"03:22", "close"=>"15:32", "rest_id"=>"34", "day_id"=>"1"}, "4"=>{"open"=>"16:44", "close"=>"21:09", "rest_id"=>"34", "day_id"=>"1"}, "5"=>{"open"=>"18:06", "close"=>"19:07", "rest_id"=>"34", "day_id"=>"1"}, "6"=>{"open"=>"08:08", "close"=>"20:08", "rest_id"=>"34", "day_id"=>"1"}}, "user_id"=>"34"
    assert rest.save

    rest_copy = Restaurant.find(rest.id)

    assert_equal rest.address, rest_copy.address

    # rest.address = "123"

    # assert rest.save
    # assert rest.destroy
  end


  # def test_hours

  #   rest = Restaurant.new :user_id => restaurants(:rest_input).user_id, 
  #                         :address => restaurants(:rest_input).address,
  #                         # :hours => restaurants(:rest_input).hours

  #   assert rest.save

  #   rest_copy = Restaurant.find(rest.id)

  #   assert_equal rest.hours, rest_copy.hours

  #   # rest.user_id = "9:00 am - 10:00 pm"

  #   assert rest.save
  #   assert rest.destroy
  # end

  def test_count

    # rest = Restaurant.new :user_id => restaurants(:rest_input).user_id, 
    #                       :address => restaurants(:rest_input).address,
    #                       :hours => [Hour.new(:rest_id => 1, :day_id => 1, :open => Time.now, :close => Time.now)]
    rest =   Restaurant.new "description"=>"123", "price"=>"123", "address"=>"123", "rest_type"=>"Italian", "hours_attributes"=>{"0"=>{"open"=>"11:11", "close"=>"11:11", "rest_id"=>"34", "day_id"=>"1"}, "1"=>{"open"=>"14:22", "close"=>"14:22", "rest_id"=>"34", "day_id"=>"1"}, "2"=>{"open"=>"15:32", "close"=>"15:33", "rest_id"=>"34", "day_id"=>"1"}, "3"=>{"open"=>"03:22", "close"=>"15:32", "rest_id"=>"34", "day_id"=>"1"}, "4"=>{"open"=>"16:44", "close"=>"21:09", "rest_id"=>"34", "day_id"=>"1"}, "5"=>{"open"=>"18:06", "close"=>"19:07", "rest_id"=>"34", "day_id"=>"1"}, "6"=>{"open"=>"08:08", "close"=>"20:08", "rest_id"=>"34", "day_id"=>"1"}}, "user_id"=>"34"
    assert rest.save

    rest_copy = Restaurant.find(rest.id)
    rest_count = Restaurant.count

    assert_equal 2, rest_count

    assert rest.save
    assert rest.destroy
  end

































end
