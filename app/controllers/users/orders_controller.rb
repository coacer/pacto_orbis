class Users::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @user = current_user
  end

  def create
    @DELIVELY_COST = 500
    bool = true
    bool = create_address if params[:order][:address].to_i == -1
    if bool
      @order = current_user.orders.build(order_params)
      if @order.save
        current_user.cart_items.each do |cart_item|
          @order.order_details.create!(item_id: cart_item.id, cd_amount: cart_item.amount,
                                       cd_price: cart_item.item.price)
          cart_item.destroy
        end
        redirect_to finish_users_orders_path
      else
        @user = current_user.reload
        render :new
      end
    else
      @user = current_user.reload
      render :new
    end
  end

  def finish
  end

  private
    def address_params
      params.require(:address).permit(:name, :postal_code, :prefecture_name, :city, :street)
    end

    def order_params
      case params[:order][:address].to_i
      when 0
        postal_code = current_user.postal_code
        address = current_user.address
      when -1
        postal_code = @address.postal_code
        address = @address.address
      else
        address_record = Address.find(params[:order][:address]) 
        postal_code = address_record.postal_code
        address = address_record.address
      end
      { postal_code: postal_code, address: address, payment: params[:order][:payment].to_i,
        total_price: current_user.cart_sum_price + @DELIVELY_COST, delivery_cost: @DELIVELY_COST }
    end

    def create_address
      @address = current_user.addresses.build(address_params)
      @address.save
    end
end
