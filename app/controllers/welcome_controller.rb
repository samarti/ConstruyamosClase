class WelcomeController < ApplicationController
    def index
        if logged_in?
            id = current_teacher.id
            @last_comments_aux = Document.all.select{|doc| doc[:teacher_id] == id}.collect{|x| x.ratings}.sort! {|a,b| a.created_at <=> b.created_at}[0]
            if !@last_comments_aux.nil?
                @last_received_comments = @last_comments_aux.take(3)
            else
                @last_received_comments = []
            end
        end
    end


end
