class AdminsController < ApplicationController
  before_action :is_admin?

  def is_admin?
    unless current_or_guest_user.admin?
      redirect_to root_path
    end
  end

end