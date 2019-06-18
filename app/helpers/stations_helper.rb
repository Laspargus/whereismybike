# frozen_string_literal: true

module StationsHelper
  def checklatitude
    return true if params[:latitude].present? || params[:location].present?
 end

 def distance (station,lat,lon)
  distance = Geocoder::Calculations.distance_between([station.latitude, station.longitude],[lat,lon])
  return distance * 1000
 end
end
