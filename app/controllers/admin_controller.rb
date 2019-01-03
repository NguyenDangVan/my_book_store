class AdminController < ApplicationController
  before_action :logged_in_admin

  def logged_in_admin
    if logged_in?
      redirect_to root_url if current_user.role == 0
    else
      redirect_to admin_root_url
    end
  end
end
