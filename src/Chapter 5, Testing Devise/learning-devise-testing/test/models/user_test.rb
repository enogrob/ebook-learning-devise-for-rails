require 'test_helper'

class UserTest < ActiveSupport::TestCase
	include ActiveModel::ForbiddenAttributesProtection

  test "sign up" do
    user = User.new({
    	:email => "hafizbadrie@hotmail.com",
    	:username => "hafizblubis",
    	:password => "devisetest",
    	:password_confirmation => "devisetest"
    })
    
    assert user.save, "User not signed up!"
  end

  test "user edit with password" do
  	user = User.first
  	new_data = {
  		:username => "hafizlubis",
  		:current_password => "hafizmelulu",
  		:password => "devisetest",
  		:password_confirmation => "devisetest"
  	}
  	new_data = ActionController::Parameters.new(new_data)
  	new_data = new_data.permit(:email, :username, :current_password, :password, :password_confirmation)
    user.update_with_password(new_data)

  	assert_equal user.username, 'hafizlubis', "Password is not updated"
  end

  test "user edit without password" do
  	user = User.first
  	new_data = {
  		:email => "hafizbadrie@gmail.com",
  		:username => "hafizlubis"
  	}
  	new_data = ActionController::Parameters.new(new_data)
  	new_data = new_data.permit(:email, :username)
    user.update_without_password(new_data)
  	
  	assert_equal user.username, 'hafizlubis', "User is not updated"
  end

  test "user deletion" do
    user = User.first
    user.destroy
    deleted_user = User.first

    assert deleted_user.nil?, "User is not deleted"
  end

end