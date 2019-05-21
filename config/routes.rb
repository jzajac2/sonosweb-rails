Rails.application.routes.draw do
  get 'text_to_speech/say'
  root 'presets#display'
  get 'presets', to: 'presets#play_preset'
  post 'presets', to: 'presets#play_preset'
end
