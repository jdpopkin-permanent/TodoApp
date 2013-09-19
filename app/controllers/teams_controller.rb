class TeamsController < ApplicationController

  def show
    @team = Team.includes(:projects).find(params[:id])
  end

  def new
    @team = Team.new
    render :new
  end

  def create
    @team = Team.new(params[:team])

    if @team.save
      redirect_to projects_url # teams_url?
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @team.errors.full_messages
      render :new
    end
  end
end
