module StationsHelper
   def checklatitude
    return true if params[:latitude].present? 
  end
end
