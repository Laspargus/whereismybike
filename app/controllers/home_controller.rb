
class HomeController < ApplicationController


  def index
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
    @list = JSON.parse response, symbolize_names: true
    @stations = @list[:network][:stations]
 
    #     @stations.each do|station|
    #   Station.create(
    #     name: station[:name],
    #     uid: station[:uid], 
    #     latitude: station[:latitude], 
    #     longitude: station[:longitude], 
    #     ebikes: station[:ebikes], 
    #     free_bikes: station[:free_bikes], 
    #     has_ebikes: station[:has_ebikes], 
    #     empty_slots: station[:empty_slots]
    #     )
    # end
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
