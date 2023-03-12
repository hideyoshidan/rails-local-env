class UsersController < ApplicationController
  # create function 以外はmustで認証必要
  before_action :authenticate, except: :create

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
      token = JwtService::JwtTokenProvider.create_new_token({:id => @user.id})
      render json: {token: token}, status: 200
    end
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    render json: { id: @user.id }, status: 200
  end

  def update
  end

  def destroy
  end 
end


