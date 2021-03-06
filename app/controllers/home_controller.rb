# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @stations = Station.where("free_bikes > 0")

    if params[:latitude].present?

      @latitude = params[:latitude]
      @longitude = params[:longitude]
      @stations = Station.near(@latitude, @longitude).take(5)

    elsif params[:location].present?
      adress = Geocoder.search(params[:location])
      @latitude = adress.first.coordinates[0]
      @longitude = adress.first.coordinates[1]
      @stations =  Station.near(@latitude, @longitude).take(5)

    else
      @latitude = '48.872131'
      @longitude = '2.346660'
      @stations = Station.near("9 rue Bergère, Paris 75002, France").take(5)
    end
  end

  def show; end

  def new; end

  def create
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
    @list = JSON.parse response, symbolize_names: true
    @stations = @list[:network][:stations]
  end

  def edit; end

  def update; end

  def destroy; end
end
