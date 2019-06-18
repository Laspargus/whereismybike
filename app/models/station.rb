# frozen_string_literal: true

class Station < ApplicationRecord
  geocoded_by latitude: :latitude, longitude: :longitude
end
