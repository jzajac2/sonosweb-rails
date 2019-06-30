require 'uri'

class TextToSpeechController < ApplicationController
  HOST = 'http://192.168.1.26'.freeze
  PORT = '5005'.freeze # port of the sonos node api service
  def speak
    speak_what = params[:text_to_speak]
    logger.debug "speak_what=#{speak_what}"
    if !speak_what.present? then return end
    speak_what_encoded = ERB::Util.url_encode(speak_what)
    logger.debug "speak_what_encoded=#{speak_what_encoded}"
    uri = "#{HOST}:#{PORT}/sayall/#{speak_what_encoded}"
    begin
      logger.debug "uri=#{uri}"
      response = open(uri).read     
    rescue ActionController::UnknownFormat => e
      if e.include? '204'
        # do nothing
      else
        logger.debug "Exception in text_to_speech_controller: #{e.to_s}"
        raise e
      end
    rescue Exception => e
      logger.debug "Exception in text_to_speech_controller: #{e.to_s}"
      raise e 
    end
    redirect_to :controller => 'presets', :action => 'display'
  end
end
