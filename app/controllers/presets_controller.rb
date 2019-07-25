require 'net/http'
require 'rest-client'
require 'httparty'
require 'open-uri'

class PresetsController < ApplicationController

  # whoops - is this working??? no...
  HOST = 'http://192.168.1.26'.freeze
  PORT = '5005'.freeze # port of the sonos node api service
  # HOST = MAIN_CONFIG['host']
  # PORT = MAIN_CONFIG['port']

  def display
  end

  def play_preset
    name = params[:preset_name]
    name = name.gsub!(' ', '%20')
    begin
      path = "#{HOST}:#{PORT}/preset/#{name}" 
      logger.debug "calling preset #{name} with: path=#{path}"
      response = open(path).read     
    rescue ActionController::UnknownFormat => e
      if e.include? '204'
        # do nothing
      else
        logger.debug "Exception in presets_controller: #{e.to_s}"
        raise e
      end
    end
    redirect_to :controller => 'presets', :action => 'display'
  end

end
