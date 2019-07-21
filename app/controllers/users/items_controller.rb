class Users::ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  protect_from_forgery except: :get_songs

  def index
    @model_name = params[:model]
    @record = get_record_by(id: params[:id], model: @model_name)
    @items = @record.nil? ? Item.page(params[:page]).reverse_order : @record.items.page(params[:page]).reverse_order
    @artists = Artist.all.shuffle[0..7]
    @labels = Label.all.shuffle[0..7]
    @genres = Genre.all.shuffle[0..7]
  end

  def show
    @item = Item.find(params[:id])
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
end
