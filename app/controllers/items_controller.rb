class ItemsController < ApplicationController

  def new
    @projects = Project.all
    @item = Item.new
    render :new
  end

  def show

  end

  def create
    @item = Item.new(params[:item])
    @item.completed = false

    if @item.save
      redirect_to project_url(@item.project_id)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @item.errors.full_messages
      @projects = Project.all
      render :new
    end
  end

  def edit

  end

  def update

  end

end
