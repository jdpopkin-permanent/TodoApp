class UsersController < ApplicationController

  def new
    @user = User.new
    @teams = Team.all
    render :new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to projects_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @user.errors.full_messages
      @teams = Team.all
      render :new
    end

  end

  def show
    @user = User.includes(:teams).find(params[:id])
    render :show
  end
end
