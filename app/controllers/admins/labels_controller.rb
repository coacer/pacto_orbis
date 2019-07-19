class Admins::LabelsController < ApplicationController
  before_action :set_label, only: [:edit, :update, :destroy]
  def index
    @labels = Label.page(params[:page])
    @label = Label.new
  end

  def edit
    @labels = Label.page(params[:page])
  end

  def create
    @label = Label.new(label_params)
    @labels = Label.page(params[:page])
    if @label.save
      flash[:success] = "レーベルを作成しました"
      redirect_to admins_labels_url
    else
      render :index
    end
  end

  def update
    @labels = Label.page(params[:page])
    if @label.update(label_params)
      flash[:success] = "レーベルを編集しました"
      redirect_to admins_labels_url
    else
      render :edit
    end
  end

  def destroy
    @label.destroy
    flash[:success] = "レーベルを削除しました"
    redirect_to admins_labels_url
  end

  private
    def set_label
      @label = Label.find(params[:id])
    end

    def label_params
      params.require(:label).permit(:name)
    end
end
