# frozen_string_literal: true

class StationsController < ApplicationController
  def index
 
    if params[:latitude].present?
      @latitude = params[:latitude]
      @longitude = params[:longitude]
    elsif params[:location].present?
      adress = Geocoder.search(params[:location])
      @latitude = adress.first.coordinates[0]
      @longitude = adress.first.coordinates[1]
    else
      @latitude = '48.872131'
      @longitude = '2.346660'
    end

    @stations = Station.where("free_bikes > 0").near([@latitude, @longitude]).take(5)

    respond_to do |format|
      format.html
      format.js
    end

  end
end
