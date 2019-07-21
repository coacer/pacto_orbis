class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genre, only: [:edit, :update, :destroy]
  def index
    @genres = Genre.page(params[:page])
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.page(params[:page])
    if @genre.save
      flash[:success] = "ジャンルを作成しました"
      redirect_to admins_genres_url
    else
      render :index
    end
  end

  def edit
    @genres = Genre.page(params[:page])
  end

  def update
    @genres = Genre.page(params[:page])
    if @genre.update(genre_params)
      flash[:success] = "ジャンルを編集しました"
      redirect_to admins_genres_url
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
    flash[:success] = "ジャンルを削除しました"
    redirect_to admins_genres_url
  end

  private
    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre).permit(:name)
    end
end
