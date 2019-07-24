class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を編集しました"
      redirect_to admins_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to admins_users_path 
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :kana_first_name,
                                   :kana_last_name, :postal_code, :prefecture_name,
                                   :city, :street, :phone, :email)
  end
end
