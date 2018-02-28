class UsersController < ApplicationController

  def index
  end

  def search
    @found_users = User.search(params[:query]).page(params[:page]).per(6) if params[:query].present?
    #binding.pry
    respond_to do |format|
      format.html
      format.js do
        render partial: "users/search.js", :layout => false
      end


    end

  end

  def edit
    @user = User.find(params[:id])
    @technologies = Technology.all
    @languages = Language.all.map { |c| [c.name, c.id] }
    redirect_to user_profile_index_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @technologies = @user.technologies
  end
end
