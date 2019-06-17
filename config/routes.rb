# frozen_string_literal: true

Rails.application.routes.draw do

  get 'initialization/index'
  root 'home#index'
  resources :homes
  
end
