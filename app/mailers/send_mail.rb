class SendMail < ActionMailer::Base
  default from: "admin@example.com"

  def msg_send(employee)
  	@employee = employee
  	mail(to: employee.email, subject: "Your salary have been deposite")
  end

end
