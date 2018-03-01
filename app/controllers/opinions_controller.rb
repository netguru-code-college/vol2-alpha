class OpinionsController < ApplicationController
  before_action :set_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_opinion, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @opinion = current_user.written_opinions.new(user: @user)
  end

  def create
    @opinion = current_user.written_opinions.new(opinion_params)
    if @opinion.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @opinion.update(opinion_params)
      redirect_to @user, notice: 'Opinion was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @opinion.destroy
    redirect_to @user, notice: 'Opinion was successfully destroyed.'
  end

  private

  def opinion_params
    params.require(:opinion).permit(:id, :content, :rating, :user_id, :author_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_opinion
    @opinion = Opinion.find(params[:id])
  end
end
