# frozen_string_literal: true

class InitializationController < ApplicationController
  def index
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
    @list = JSON.parse response, symbolize_names: true
    @rest_stations = @list[:network][:stations]

    @rest_stations.each do |station|
      Station.create(
        name: station[:name],
        uid: station[:id],
        latitude: station[:latitude],
        longitude: station[:longitude],
        ebikes: station[:ebikes],
        free_bikes: station[:free_bikes],
        has_ebikes: station[:has_ebikes],
        empty_slots: station[:empty_slots]
      )
    end
end
end
