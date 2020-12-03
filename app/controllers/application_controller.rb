class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  # include ActionController::RequestForgeryProtection

  # protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end
      
  def logged_in?
    !!current_user
  end

end
