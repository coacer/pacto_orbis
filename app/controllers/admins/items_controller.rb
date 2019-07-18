class Admins::ItemsController < ApplicationController
  protect_from_forgery except: :get_songs
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def show
  end

  def new
    @item = Item.new
    @disk = @item.disks.build
    @song = @disk.songs.build
  end

  def create
    @item = Item.new(item_params)
    have_disks = !(@item.disks.empty? || @item.disks.first.songs.empty?)
      unless have_disks
        flash[:error] = "ディスクを入力してください"
      end

      if @item.save && have_disks
        flash[:success] = "商品を作成しました"
        redirect_to admins_item_url(@item)
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = "商品を編集しました"
      redirect_to admins_item_url(@item)
    end
  end

  def destroy
    @item.destroy
    flash[:success] = "商品を削除しました"
    redirect_to admins_items_url
  end

  def get_songs
    disk = Disk.find(params[:id])
    songs = disk.songs
    render json: songs
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:artist_id, :label_id, :genre_id, :title,
                                   :price, :status, :stock, :jacket_image,
                                   disks_attributes: [:id, :_destroy,
                                   songs_attributes: [:id, :_destroy, :title]])
    end
end
