class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:success] = "ユーザー情報を編集しました"
      redirect_to users_users_url
    else
      render :edit
    end
  end

  def unsubscribe_confirm
  end

  def unsubscribe
    current_user.update(is_deleted: true)
    reset_session
    flash[:success] = "退会しました"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :kana_first_name,
                                   :kana_last_name, :postal_code, :prefecture_name,
                                   :city, :street, :phone, :email)
    end
end
