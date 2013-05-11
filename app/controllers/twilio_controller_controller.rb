class TwilioControllerController < ApplicationController
  def process_sms
		 @message= params[:Body].split(":").last
		  @from = Employee.find_by_phone("#{params[:From]}").name
			if params[:Body].split.first.eql?("@account")
				@name = Employee.find_by_department_id(2).name
			end
			@message_save =EmployeeStaffMessage.new(:send_from=>@from,:send_to=>@name,:message=>@message)
			@message_save.save
		render 'process_sms.xml.erb', :content_type => 'text/xml'
  end
end
