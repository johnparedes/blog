class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email].downcase
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully signed in."
      redirect_to dashboard_url
    else
      flash.now[:alert] = "Invalid email or password."
      render "new"
    end
  end

  def destroy
    sign_out
    flash[:notice] = "Successfully signed out."
    redirect_to root_url
  end

end
