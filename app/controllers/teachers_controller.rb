class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  def new
    @error = params[:error]
    render 'new', layout: "template/_layout_login"
  end

  def create
    @teacher = Teacher.new(user_params)
    binding.pry
    if @teacher.save
      log_in @teacher
      redirect_to '/'
    else
      redirect_to '/signup?error=1'
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @teacher.update(user_params)
        format.html { redirect_to @teacher, notice: 'Tu perfil se actualizó exitosamente' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def user_params
    params.require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
