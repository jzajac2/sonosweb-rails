Rails.application.routes.draw do
  get 'text_to_speech/say'
  root 'presets#display'
  get 'presets', to: 'presets#play_preset'
  post 'presets', to: 'presets#play_preset'
  get 'text_to_speech', to: 'text_to_speech#speak'
end
