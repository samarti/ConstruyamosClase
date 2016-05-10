class SessionsController < ApplicationController
  def new
    #render partial: "layouts/template/sign_in", layout: "template/layout_login"
    render 'new', layout: "template/_layout_login"
  end



  def create
    teacher = Teacher.find_by(email: params[:email].downcase)
    if teacher && teacher.authenticate(params[:password])
      log_in teacher

      redirect_to '/'
      # Log the user in and redirect to the user's show page.
    else
      #podemos manejar errores por separado pero mientras tanto esto basta
      @error = true
      render 'new', layout: "template/_layout_login"
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end



