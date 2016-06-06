module WelcomeHelper
  def get_day weekday_number
    weekdays = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]
    return weekdays[weekday_number-1]
  end

  def get_month month_number
    months =  ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"]
    return months[month_number-1]
  end
end
