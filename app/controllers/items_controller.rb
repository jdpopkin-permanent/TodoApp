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

  def batch_update
    # Separate ids for whom completed is to be set to true
    true_ids = []
    false_ids = []
    params[:items].each do |key, value|
      if value[:completed] == "true"
        true_ids << key
      else
        false_ids << key
      end
    end

    # Use one query to set all true_ids to true
    Item.where(id: true_ids).update_all(completed: true)
    Item.where(id: false_ids).update_all(completed: false)

    # get one of the Items and find its project id to send us there
    project_id = Item.find(params[:items].keys.first.to_i).project_id
    redirect_to project_url(project_id)

  end

end
