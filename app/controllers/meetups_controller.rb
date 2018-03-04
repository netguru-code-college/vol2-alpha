class MeetupsController < ApplicationController
  def index
    @technology_names = Technology.all.pluck(:name).sort
    @meetups = if params[:query]
                 Meetup.queried(params[:query]).decorate
               else
                 Meetup.all.decorate
               end
    @hash = build_map(@meetups)
  end

  def show
    @meetup = Meetup.find(params[:id]).decorate
    @hash = build_map(@meetup)
  end

  private

  def build_map(map_elements)
    Gmaps4rails.build_markers(map_elements) do |meetup, marker|
      marker.lat meetup.lat
      marker.lng meetup.lng
      marker.infowindow meetup.info_html_text
    end
  end
end
