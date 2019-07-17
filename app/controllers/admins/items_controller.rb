class Admins::ItemsController < ApplicationController
  protect_from_forgery except: :get_songs
  before_action :set_item, only: [:show, :edit, :update]
  def index
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
    if @item.save
      flash[:success] = "商品を作成しました"
      redirect_to admins_item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = "商品を編集しました"
      redirect_to admins_item_path(@item)
    end
  end

  def destroy
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
