class Employee < ActiveRecord::Base
  attr_accessible :department_id, :email, :name, :password, :phone, :salary

  belongs_to :department


  def mail
  	@employee.each do |emp|
  		emp.email
  	end
  end


end
