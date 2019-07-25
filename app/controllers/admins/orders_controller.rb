class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_order, only: [:show, :update]

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
  end

  def update
    @order.update(order_params)
    flash[:success] = "注文履歴を更新しました"
    redirect_to admins_order_path(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:status)
    end
end
