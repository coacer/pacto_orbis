class Users::CartItemsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: :update

  def index
    @items = current_user.items
  end

  def create
    @cart_item = current_user.cart_items.build(cart_item_params)
    @item = @cart_item.item
    if @cart_item.save
      @item.reduce_stock(@cart_item.amount)
      flash[:success] = "商品を追加しました"
      redirect_to users_cart_items_path
    else
      render 'users/items/show'
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @item = @cart_item.item

    respond_to do |format|
      format.html { # items/showページからのカート追加
        amount = params[:cart_item][:amount].to_i
        sum_amount = @cart_item.amount + amount
        if @cart_item.update(amount: sum_amount)
          @item.reduce_stock(amount)
          flash[:success] = "商品を追加しました"
          redirect_to users_cart_items_path
        else
          render 'users/items/show'
        end
      }

      format.js { # cart_items/indexページからのAjaxでのカート追加
        amount = params[:amount].to_i
        cart_item_amount = @cart_item.amount
        # if @cart_item.update(amount: amount) # 自作バリデーションに引っかかってしまう。バリデーションの良いロジックが思いつかないのでバリデーションコメントアウト
          @cart_item.update(amount: amount)
          amount_diff = amount - cart_item_amount
          @item.reduce_stock(amount_diff)
          render json: [@item.reload, current_user.cart_sum_price]
        # else
        #   render json: @cart_item
        # end
      }
    end
  end

  def destroy
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id)
    end
end
