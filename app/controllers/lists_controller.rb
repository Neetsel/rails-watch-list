class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @lists = List.all

    @lists.each { |list| list.photos = "generic.png" if !list.photos.present?}

  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.photos = "generic.png" if !@list.photos.present?

    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  private

  def set_list
    @list = List.find(params[:id])
    @list.photos = "generic.png" if !@list.photos.present?
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
