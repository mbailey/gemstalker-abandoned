class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    # Just trust them for now
    if params[:email]
      @current_user = User.find_or_create_by_email(params[:email])
      session[:user_id] = @current_user.id
    else
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    @current_user
  rescue
    nil
  end

  helper_method :current_user

end
