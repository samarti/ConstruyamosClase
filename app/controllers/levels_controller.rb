class LevelsController < ApplicationController
    before_action :should_show_content?, only: [:index]
    def index
        @levels = current_teacher.levels
        respond_to do |format|
          format.html
          format.xml { render :xml => @levels.to_xml() }
          format.json { render :json => @levels.to_json() }
        end
    end

    def should_show_content?
        if !logged_in?
            redirect_to login_path
        end
    end
end
