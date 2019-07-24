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
      flash[:success] = "編集しました"
      redirect_to admins_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "削除しました"
    redirect_to admins_users_path 
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name,
                                 :kana_last_name, :postal_code, :address, :phone,
                                 :email)
  end
end
