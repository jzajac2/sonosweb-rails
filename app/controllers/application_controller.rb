class ApplicationController < ActionController::Base
    def index 
      @index_content = "Music Presets"
    end

    def after_sign_in_path_for(resource)
      root_path
    end
end
