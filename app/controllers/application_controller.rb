class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user = Employee.find_by_id(session[:current_employee]).name
  end
end
