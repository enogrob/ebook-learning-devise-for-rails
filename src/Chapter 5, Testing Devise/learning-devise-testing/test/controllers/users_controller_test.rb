require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	include Devise::TestHelpers

	test "should be redirected" do
		get :index
    assert_redirected_to new_user_session_path, "User is not redirected!"
	end

  #test "should sign in"  do
  #	@request.env["devise.mapping"] = Devise.mappings[:user]

  #	user = User.first    
  #  sign_in user
    
  #  get :index
  #  assert_response :success, "User is not signed in!"
  #end

end
