class MainController < ApplicationController
  def add
  	@employee = Employee.new 
  end


	def log_in
	@employee = Employee.find(:first, :conditions => [ "name = ? AND password = ?", params[:name],params[:password]])
	if @employee.nil?
		redirect_to :root
	else
		session[:current_employee]=@employee.id
		redirect_to main_main_page_path
	end
	end

	def main_page
		@department = Department.all
	end
	
	def message_page
		@employee = Employee.find(:all).paginate(page: params[:page], per_page: 1)

		#Mail.msg_send(@employee).mail.deliver
		
	end

	def log_out
		session[:current_employee_id] = nil
		redirect_to root_url, notice: "You have successfully logged out!"	
	end
	
end
