# frozen_string_literal: true

Rails.application.routes.draw do


  root 'stations#index'

  resources :stations
  
end
