class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
      render json: items, include: :user
    else
      render json: Item.all, include: :user
    end
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    newItem = Item.create(name: params[:name],description: params[:description],price: params[:price], user_id: params[:user_id])
    render json: newItem, status: :created
  end

end
