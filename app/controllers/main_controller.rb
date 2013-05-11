class MainController < ApplicationController
  def index
  end

  def new
  end

  def add
  end

  def delete
  end

  def create
  end

	def log_in
	@employee = Employee.find(:first, :conditions => [ "name = ? AND password = ?", params[:name],params[:password]])
	if @employee.nil?
		redirect_to :root
	else
		binding.pry
		session[:current_employee]=@employee.id
		redirect_to main_main_page_path
	end
	end

	def main_page
		@department = Department.all
		binding.pry
	end
	
	def message_page
		binding.pry	
	end
end
