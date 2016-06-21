class NavigationController < ApplicationController
    def index
        @categories = Subject.all
        render :index
    end

    def documents
        @category = Subject.where("id = #{params[:id]}").first
        @cat_documents = Subject.get_documents(params[:id])
        respond_to do |format|
            format.html { render :leveldocuments }
            format.json { render :json => @cat_documents.to_json() }
        end
    end

    private

    def get_color_for_card(i)
        j = i % 4
        case j
        when 0
            'red'
        when 1
            'orange'
        when 2
            'green'
        else
            'purple'
        end
    end

    helper_method :get_color_for_card
    end
