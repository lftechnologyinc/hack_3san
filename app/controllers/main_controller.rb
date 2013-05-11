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
		redirect_to main_main_page_path
	end
	end

	def main_page

	end
end
