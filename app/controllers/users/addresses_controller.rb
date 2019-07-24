class Users::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:edit, :update, :destroy]

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      # 購入確定ボタンを押した後の処理一連
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      flash[:success] = "住所を編集しました"
      redirect_to users_users_path
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    flash[:success] = "住所を削除しました"
    redirect_to users_users_path
  end

  private
    def address_params
      params.require(:address).permit(:name, :postal_code, :prefecture_name, :city, :street)
    end

    def set_address
      @address = Address.find(params[:id])
    end
end
