class Admin::UsersController < ApplicationController

def index
  if admin_signed_in?
    @users = User.all
  else
    redirect_to user_titles_path
  end
end

def edit
  if admin_signed_in?
    @user = User.find(params[:id])
  else
    redirect_to user_titles_path
  end
end

def show
  #if admin_signed_in?
    @user = User.find(params[:id])
    @orders = @user.orders
  #else
   # redirect_to user_titles_path
  #end
end

def update
  if admin_signed_in?
    @user = User.find(params[:id])
    if @user.update(user_params)
  	  redirect_to admin_user_path(@user.id)
    end
  else
    redirect_to user_titles_path
  end
end

private
  def user_params
  	params.require(:user).permit(:name, :name_kana,
  		:postal_code, :address, :tel_number, :email)
  end
end
