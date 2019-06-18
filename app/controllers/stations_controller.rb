# frozen_string_literal: true

class StationsController < ApplicationController
  def index
    @stations = Station.where("free_bikes > 0")
    if params[:latitude].present?
      @latitude = params[:latitude]
      @longitude = params[:longitude]
      @stations = Station.near([@latitude, @longitude]).take(5)
    elsif params[:location].present?
      adress = Geocoder.search(params[:location])
      @latitude = adress.first.coordinates[0]
      @longitude = adress.first.coordinates[1]
      @stations =  Station.near([@latitude, @longitude]).take(5)
    else
      @latitude = '48.872131'
      @longitude = '2.346660'
      @stations = Station.near("9 rue Bergère, Paris 75002, France").take(5)
    end

    respond_to do |format|
      format.html
      format.js
    end
    
  end
end
