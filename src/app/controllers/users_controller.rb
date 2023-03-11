class UsersController < ApplicationController
  def user_params 
      params.require(:user).permit(:user_name, :email, :password)
  end

  # Get User Data
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  # user作成
  # save と save! の違い
  # https://magazine.techacademy.jp/magazine/22082
  def create
    @user = User.new(user_params)
    if @user.save!
      head :no_content
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end  
end


