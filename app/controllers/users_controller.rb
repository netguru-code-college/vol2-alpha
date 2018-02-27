class UsersController < ApplicationController

  def index
  end

  def search
    @found_users = User.search(params[:query]) if params[:query].present?
  end

  def edit
    @user = User.find(params[:id])
    @technologies = Technology.all
    @languages = Language.all.map { |c| [c.name, c.id] }
    redirect_to user_profile_index_path(@user)
  
  def show
    @user = User.find(params[:id])
    @technologies = @user.technologies
  end
end
