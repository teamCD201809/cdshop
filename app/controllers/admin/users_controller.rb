class Admin::UsersController < ApplicationController

def index
  @users = User.all
end

def edit
  @user = User.find(params[:id])
end

def show
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
  	redirect_to admin_user_path(@user.id)
  end
end

private
  def user_params
  	params.require(:user).permit(:name, :name_kana,
  		:postal_code, :address, :tel_number, :email)
  end
end
