class ItemsController < ApplicationController

  def new
    @projects = Project.all
    @item = Item.new
    render :new
  end

  def show
    @item = Item.find(params[:id])
    render :show
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
    @item = Item.find(params[:id])
    @projects = Project.all
    render :edit
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to project_url(@item.project_id)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @item.errors.full_messages
      @projects = Project.all
      render :new
    end
  end

  def index
    @project_id = params[:project_id]
    @items = Item.where(project_id: @project_id)

    render :index
  end

end
