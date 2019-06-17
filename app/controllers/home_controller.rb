
class HomeController < ApplicationController


  def index

    @stations = Station.where("free_bikes > 0")
    if params[:latitude].present?
      @stations = Station.near([params[:latitude], params[:longitude]]).take(5)
     else
      @stations = Station.near("9 rue Bergère, Paris 75002, France").take(5)
    end

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
