class MeetupsController < ApplicationController

  def index
    @meetups = Meetup.all
  end

  # def search
  #   @found_users = User.search(params[:query]).page(params[:page]).per(6) if params[:query].present?
  #
  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  # end
end
