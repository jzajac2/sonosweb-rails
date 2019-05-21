class TextToSpeechController < ApplicationController

  def say(text_to_say)

    say = params[:text_to_say]

    begin
      response = open("#{HOST}:#{PORT}/text_to_speech/#{}").read     
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
