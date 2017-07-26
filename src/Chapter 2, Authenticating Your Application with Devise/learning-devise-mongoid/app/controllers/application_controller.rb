class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
		if resource_name == :admin 
			"devise_admin_application"
		elsif resource_name == :employee
			"devise_employee_application"
		else
			"devise_application"
		end
    else
      "application"
    end
  end
end
