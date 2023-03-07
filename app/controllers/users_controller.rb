class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:name, :email, :password, :login, :location)
    end
  end
end
