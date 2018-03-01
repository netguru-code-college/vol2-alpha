class MeetupsController < ApplicationController
  def index
    @technology_names = Technology.all.pluck(:name).sort
    @meetups = if params[:query]
                 Meetup.queried(params[:query]).decorate
               else
                 Meetup.all.decorate
               end
    @hash = Gmaps4rails.build_markers(@meetups) do |meetup, marker|
      marker.lat meetup.lat
      marker.lng meetup.lng
      marker.infowindow meetup.info_html_text
    end
  end

  def show
    @meetup = Meetup.find(params[:id]).decorate

    @hash = Gmaps4rails.build_markers(@meetup) do |meetup, marker|
      marker.lat meetup.lat
      marker.lng meetup.lng
      marker.infowindow meetup.info_html_text
    end
  end
end
