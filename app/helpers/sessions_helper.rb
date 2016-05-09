module SessionsHelper
  def log_in(teacher)
    session[:user_id] = teacher.id
  end

  def current_teacher
    @current_teacher ||= Teacher.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_teacher.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
