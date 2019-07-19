class Users::ItemsController < ApplicationController
  def index
    @model_name = params[:model]
    @record = get_record_by(id: params[:id], model: @model_name)
    @items = @record.nil? ? Item.page(params[:page]).reverse_order : @record.items.page(params[:page]).reverse_order
    @artists = Artist.all
    @labels = Label.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
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
