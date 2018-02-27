class UsersController < ApplicationController
  def index
  end

  def search
    @found_users = User.search(params[:query]) if params[:query].present?
  end

  def all
    @users = User.all
  end
end
