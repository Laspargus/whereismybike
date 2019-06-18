require 'sidekiq-scheduler'
class StationsUpdateJob < ApplicationJob
 
  self.queue_adapter = :sidekiq

  queue_as :default

  def perform(*args)
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
    @list = JSON.parse response, symbolize_names: true
    @rest_stations = @list[:network][:stations]

    @rest_stations.each do|station|
      @station = Station.find_by(uid: station[:id])
      if @station.free_bikes != station[:free_bikes]
        @station.update(
          free_bikes: station[:free_bikes], 
          empty_slots: station[:empty_slots]
        )
        if @station.save
          puts "la station a été mise à jour"
          puts @station.name
        end
      end
    end

    puts "ca ne va jamais marcher"

  end
end
