class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show]
  before_action :authenticate_user!, only: [:edit]

  def top
    @users = UserDecorator.decorate_collection(User.top)
  end

  def search
    @found_users = User.search(params[:query]).page(params[:page]).per(6) if params[:query].present?

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @technologies = Technology.all
    @languages = Language.all.map { |c| [c.name, c.id] }
    redirect_to user_profile_index_path(@user)
  end

  def show
    @technologies = @user.technologies
    @rating_color = if @user.rating < 2
                      "danger"
                    elsif @user.rating < 4.5
                      "warning"
                    else
                      "success"
                    end
  end

  private

  def set_user
    @user = User.find(params[:id]).decorate
  end
end
