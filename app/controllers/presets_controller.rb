require 'net/http'
require 'rest-client'
require 'httparty'
require 'open-uri'

class PresetsController < ApplicationController

  HOST = 'http://192.168.1.26'.freeze
  PORT = '5005'.freeze # port of the sonos node api service

  def display
  end

  def play_preset
    name = params[:preset_name]
    begin
      path = "#{HOST}:#{PORT}/preset/#{name}" 
      puts "path=#{path}"
      response = open("#{HOST}:#{PORT}/preset/#{name}").read     
      puts "response=#{response}"
    rescue ActionController::UnknownFormat => e
      if e.include? '204'
        # do nothing
      else
        raise e
      end
    end
    redirect_to :controller => 'presets', :action => 'display'
  end

end
