class AuthenticateController < ApplicationController  
  
  def login_params
    params.require(:user).permit :email, :password
  end

  def login
    user = User.find_by(email: login_params[:email])&.authenticate(login_params[:password])
    Rails.logger.debug user
  end
end
