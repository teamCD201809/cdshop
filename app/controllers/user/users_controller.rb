class User::UsersController < ApplicationController
  def edit
    if current_user == User.find(params[:id])
    @user = User.find(params[:id])
    else
      @titles = Title.all
      redirect_to user_titles_path
    end
  end

  def show
    @user = User.find(params[:id])
    # if @user == current_user
      @orders = Order.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(5)
    # else
      # @titles = Title.all
      # redirect_to user_titles_path
    #end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
  	  redirect_to user_user_path(@user.id)
    else
       render:edit
    end
  end

def bye
    @user = User.find(params[:id])
end

def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_titles_path
  end

  private
  def user_params
  	params.require(:user).permit(:name, :name_kana,
  		:postal_code, :address, :tel_number, :email)
  end
end
