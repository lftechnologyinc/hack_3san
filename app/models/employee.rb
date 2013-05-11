class Employee < ActiveRecord::Base
  attr_accessible :department_id, :email, :name, :password, :phone, :salary
end
