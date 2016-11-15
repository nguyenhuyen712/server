class MapsController < ApplicationController
  def index
    @accident = Accident.waiting
    @hash = Gmaps4rails.build_markers(@accident) do |accident, marker|
      marker.lat accident.latitude
      marker.lng accident.longitude
      marker.infowindow accident.user.description
    end
  end
end
