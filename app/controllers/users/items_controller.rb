class Users::ItemsController < ApplicationController
  protect_from_forgery except: :get_songs

  def index
    @model_name = params[:model] # ビューで使用するためインスタンス変数に格納
    @items = get_items_record
    @artists = Artist.all.shuffle[0..7]
    @labels = Label.all.shuffle[0..7]
    @genres = Genre.all.shuffle[0..7]
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = @item.added_to_cart_by?(current_user) ? @item.cart_item_by(current_user) : CartItem.new
  end

  def get_songs
    disk = Disk.find(params[:id])
    songs = disk.songs
    render json: songs
  end

  private
    def get_record_by(id:, model:)
      case(model)
      when "Artist"
        Artist.find(id)
      when "Label"
        Label.find(id)
      when "Genre"
        Genre.find(id)
      end
    end

    def get_items_record
      if params[:model]
        @record = get_record_by(id: params[:id], model: params[:model])
        @record.items.page(params[:page]).reverse_order
      elsif params[:search]
        Item.search(params[:search])
      else
        Item.page(params[:page]).reverse_order
      end
    end
end
