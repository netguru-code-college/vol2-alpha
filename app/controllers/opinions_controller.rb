class OpinionsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @opinion = current_user.written_opinions.new(user: @user)
  end

  def create
    @user = User.find(params[:user_id])
    @opinion = current_user.written_opinions.new(opinion_params)
    if @opinion.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @opinion = Opinion.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @opinion = Opinion.find(params[:id])
    if @opinion.update(opinion_params)
      redirect_to @user, notice: 'Opinion was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    redirect_to @user, notice: 'Opinion was successfully destroyed.'
  end

  private

  def opinion_params
    params.require(:opinion).permit(:id, :content, :rating, :user_id, :author_id)
  end
end
