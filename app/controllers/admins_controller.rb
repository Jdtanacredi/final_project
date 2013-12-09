class AdminsController < ApplicationController
  before_action :is_admin?

  def is_admin?
    #binding.pry
    unless current_user.admin?
      redirect_to store_path
  end
  end
end