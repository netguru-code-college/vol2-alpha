class MeetupsController < ApplicationController
  def index
    @technology_names = Technology.all.pluck(:name).sort
    @meetups = if params[:query]
                 Meetup.includes(:technology).where(technologies: { name: params[:query] })
               else
                 Meetup.all
               end
    @hash = Gmaps4rails.build_markers(@meetups) do |meetup, marker|
      marker.lat meetup.lat
      marker.lng meetup.lng
      marker.infowindow meetup.info_html_text
    end
  end
end
