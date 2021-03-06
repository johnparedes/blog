class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created new user."
      sign_in @user
      redirect_to dashboard_url
    else
      flash[:notice] = @user.errors.full_messages
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation
    )
  end

end
