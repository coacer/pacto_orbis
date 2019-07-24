class Users::CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_user.items
  end

  def create
  end

  def update
  end

  def destroy
  end
end
