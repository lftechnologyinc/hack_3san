class EmployeeStaffMessage < ActiveRecord::Base
  attr_accessible :deliver_status, :message, :send_from, :send_to
end
