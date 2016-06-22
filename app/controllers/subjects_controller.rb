class SubjectsController < ApplicationController
    before_action :should_show_content?, only: [:index]
    def index
        @subjects = current_teacher.subjects
        respond_to do |format|
          format.html
          format.xml { render :xml => @subjects.to_xml() }
          format.json { render :json => @subjects.to_json() }
        end
    end

    def should_show_content?
        if !logged_in?
            redirect_to login_path
        end
    end
end
