class TeachersController < ApplicationController
  def new
    @error = params[:error]
    render 'new', layout: "template/_layout_login"
  end

  def create
    @teacher = Teacher.new(user_params)
    if @teacher.save
      log_in @teacher
      redirect_to '/'
    else
      redirect_to '/signup?error=1'
    end
  end

  def show
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
