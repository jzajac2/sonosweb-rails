Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users
  get 'text_to_speech/say'
  root 'presets#display'
  get 'presets', to: 'presets#play_preset'
  post 'presets', to: 'presets#play_preset'
  get 'text_to_speech', to: 'text_to_speech#speak'
end
