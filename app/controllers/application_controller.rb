class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_or_guest_user

  #NEW CODE--------------------------------------------------
  def current_or_guest_user
    if current_user
      if session[:guest_user_id]
        logging_in
        guest_user.destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  def guest_user
    # Cache the value the first time
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_user_id] = nil
    guest_user
  end

  private

  def logging_in
    #current_cart.save!
  end

  def create_guest_user
    u = User.create(:name => 'guest', :email => "guest_#{Time.now.to_i}#{rand(99)}@example.com")
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    u
  end
end
