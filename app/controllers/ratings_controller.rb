class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    respond_to do |format|
      if @rating.save
        Document.find(params[:document]).ratings << @rating
        Teacher.find(params[:teacher]).ratings << @rating
        format.html { redirect_to @rating.document, notice: 'Comentario añadido' }
        format.json { render :show, status: :created, location: @rating.document }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:grade, :comment, :document, :teacher)
    end
end
