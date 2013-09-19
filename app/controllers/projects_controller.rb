class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    render :index
  end

  def new
    @team_id = params[:team_id]
    @teams = Team.all
    render :new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to projects_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @project.errors.full_messages
    end
  end

  def show
    @project = Project.find(params[:id])
    render :show
  end

end
