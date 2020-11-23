class Api::V1::AuthController < ApplicationController

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:username])
      session[:user_id] = @user.idl
      render json: @user
    else
      render json: {
        error: "Invalid login"
      }
    end
  end

  def get_current_user
    if logged_in?
      render json: @user
    else
      render json: {
        error: "Not logged in"
      }
    end
  end

end
