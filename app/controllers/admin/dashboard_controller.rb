class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ENV["USERNAME_AUTH"],
  password: ENV["PASSWORD_AUTH"],
  if: -> { ENV["PASSWORD_AUTH"].present? }
  
  def show

  end
end
