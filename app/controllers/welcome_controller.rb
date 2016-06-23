class WelcomeController < ApplicationController
    def index
        if logged_in?
            id = current_teacher.id
            @last_received_comments = []
            @received_comments = []
            if current_teacher.documents.count > 0
                current_teacher.documents.each do |doc|
                    doc.ratings.each do |rating|
                        @received_comments << rating
                    end
                end
                @last_received_comments= @received_comments.sort! { |a,b| a.created_at <=> b.created_at}
            end
        end
    end
end
