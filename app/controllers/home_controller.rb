
class HomeController < ApplicationController


  def index
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
    @list = JSON.parse response, symbolize_names: true
    @rest_stations = @list[:network][:stations]
        @rest_stations.each do|station|
         Station.create(
         name: station[:name],
         uid: station[:uid], 
         latitude: station[:latitude], 
         longitude: station[:longitude], 
         ebikes: station[:ebikes], 
         free_bikes: station[:free_bikes], 
         has_ebikes: station[:has_ebikes], 
         empty_slots: station[:empty_slots]
         )
   end
    
    # @rest_stations.each do|station|
    #   @station = Station.find_by(uid: station[:uid])

    #   if @station.free_bikes != station[:free_bikes]
    #     @station.update(
    #       free_bikes: station[:free_bikes], 
    #       empty_slots: station[:empty_slots]
    #     )
    #   end
    # end

    @stations = Station.where("free_bikes > 0")
    @stations = Station.near("9 rue Bergère, Paris 75002, France").take(5)
  end

  def show
  end

  def new
  end

  def create
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
    @list = JSON.parse response, symbolize_names: true
    @stations = @list[:network][:stations]



  end

  def edit
  end

  def update
  end

  def destroy
  end
end
