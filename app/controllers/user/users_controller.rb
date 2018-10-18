class User::UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
  	  redirect_to user_user_path(@user.id)
    end
  end
  
def bye
    @user = User.find(params[:id])
end

  private
  def user_params
  	params.require(:user).permit(:name, :name_kana,
  		:postal_code, :address, :tel_number, :email)
  end
end
