class Admins::ArtistsController < ApplicationController
  before_action :set_artist, only: [:edit, :update, :destroy]
  def index
    @artists = Artist.page(params[:page])
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artists = Artist.page(params[:page])
    if @artist.save
      flash[:success] = "レーベルを作成しました"
      redirect_to admins_artists_url
    else
      render :index
    end
  end

  def edit
    @artists = Artist.page(params[:page])
  end

  def update
    @artists = Artist.page(params[:page])
    if @artist.update(artist_params)
      flash[:success] = "アーティストを編集しました"
      redirect_to admins_artists_url
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    flash[:success] = "アーティストを削除しました"
    redirect_to admins_artists_url
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end
end
