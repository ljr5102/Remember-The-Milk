class Api::ListsController < ApplicationController

  def index
    @lists = List.includes(:tasks).where("lists.creator_id = ?", current_user.id)
    render :index
  end

  def create
    @list = List.new(list_params)
    @list.creator_id = current_user.id
    @list.save!
    render :show
  end

  def show
    @list = List.includes(:tasks).find(params[:id])
    render :show
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(list_params)
    render :show
  end

  def destroy
    @list = List.includes(:tasks).find(params[:id])
    @list.destroy
    render :index
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

end
