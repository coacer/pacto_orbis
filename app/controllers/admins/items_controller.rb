class Admins::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:artist_id, :label_id, :genre_id, :title, :price, :status, :stock, :jacket_image)
    end
end