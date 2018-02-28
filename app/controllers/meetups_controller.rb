class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
    @hash = Gmaps4rails.build_markers(@meetups) do |meetup, marker|
      marker.lat meetup.lat
      marker.lng meetup.lng
      marker.infowindow meetup.info_html_text
    end
  end
end
