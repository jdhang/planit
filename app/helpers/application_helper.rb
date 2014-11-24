module ApplicationHelper

  def format_date(dt)
    dt.strftime("%m-%d-%Y")
  end

  def relative_date(dt)
    if (dt - Date.today) == 0
      "Today"
    elsif (dt - Date.today) == -1
      "Yesterday"
    elsif (dt - Date.today) == 1
      "Tomorrow"
    elsif (dt - Date.today) < 0
      distance_of_time_in_words(dt, Date.today) + " ago"
    elsif (dt - Date.today) > 0
      "in " + distance_of_time_in_words(dt, Date.today)
    end
  end

end
