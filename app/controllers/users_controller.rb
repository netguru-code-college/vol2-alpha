class UsersController < ApplicationController
  def index
  end

  def search
    @found_users = User.search(params[:query]) if params[:query].present?
  end
  
  def show
    @user = User.find(params[:id])
    @technologies = @user.technologies
  end
end
