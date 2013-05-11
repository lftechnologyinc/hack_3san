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
		if params[:id].nil?
			@employee = Employee.all
			@message = EmployeeStaffMessage.all
		else
			session[:department_id]=params[:id]
		@employee=Employee.find(:all, :conditions => [ "department_id = ?", params[:id]])
			@message = EmployeeStaffMessage.all
		end
	end
	def message_deliver
		@name =params[:message].split.first
		@name.gsub!("@","")
		@employee=Employee.find(:all, :conditions => [ "department_id = ? AND name =?", session[:department_id],@name])
		if @employee.nil?
			redirect_to :back
		else
		twilio_sid = "ACd33f3afdfbc3e4178bd81cebcc482a90"
		twilio_token = "a1e2751c411974085e49644f528698ad"
		twilio_phone_number = "+12026013509"
		@twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
		current_name = Employee.find_by_id(session[:current_employee])
		@sender = current_name.name
		 @message=params[:message].split(":").last
		@employee.each do |t|
			@status= @twilio_client.account.sms.messages.create(:from => "#{twilio_phone_number}",:to => "#{t.phone}",:body => "#{@message}"+" sender:"+"#{@sender}")
			if @status.nil?
				redirect_to :back
			else
				@message_save= EmployeeStaffMessage.new(:send_from=>@sender,:send_to=>t.name,:message=>@message)
				@message_save.save
				redirect_to :back
			end
		end
		end
	end

	def log_out
		session[:current_employee_id] = nil
		redirect_to root_url, notice: "You have successfully logged out!"	
	end
	
end
