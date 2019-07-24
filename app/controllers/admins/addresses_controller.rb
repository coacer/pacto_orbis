class Admins::AddressesController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:success] = "住所を削除しました"
    redirect_to admins_user_path(@address.user)
  end
end
