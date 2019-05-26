class TextToSpeechController < ApplicationController

  def speak(text_to_say)

    speak_what = params[:text_to_say]

    begin
      response = open("#{HOST}:#{PORT}/text_to_speech/#{speak_what}").read     
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
