class WelcomeController < ApplicationController
    def index
        if logged_in?
            id = current_teacher.id
            @last_comments_aux = Document.all.select{|doc| doc[:teacher_id] == 2}.collect{|x| x.ratings}[0].take(3)

            if !@last_comments_aux.nil?
                @last_received_comments = @last_comments_aux.take(3)
            else
                @last_received_comments = []
            end
        end
    end


end
