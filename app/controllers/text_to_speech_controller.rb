require 'uri'

class TextToSpeechController < ApplicationController
  HOST = 'http://192.168.1.26'.freeze
  PORT = '5005'.freeze # port of the sonos node api service
  def speak
    speak_what = params[:text_to_speak]
    # speak_what = 'go to sleep'
    puts "speak_what=#{speak_what}"
    if !speak_what.present? then return end
    speak_what_encoded = ERB::Util.url_encode(speak_what)
    puts "speak_what_encoded=#{speak_what_encoded}"
    uri = "#{HOST}:#{PORT}/sayall/#{speak_what_encoded}"
    begin
      puts "uri=#{uri}"
      response = open(uri).read     
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
