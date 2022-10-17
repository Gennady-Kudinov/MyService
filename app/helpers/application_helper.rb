module ApplicationHelper
  def convert_date(date)
    date.strftime("%e.%m.%Y") if date.present?
  end
end
