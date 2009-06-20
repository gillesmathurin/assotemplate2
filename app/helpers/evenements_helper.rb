module EvenementsHelper
  def calendar_events_proc
    lambda do |day|
      if Evenement.has_events_on?(day)
          [link_to(day.day, evenenemts_du_jour_path(day)), {}]
      else
          day.day
      end
    end
  end
  
  def has_photo?(evenement)
    if evenement.photo.url != "/photos/original/missing.png"
      return true
    else
      return false
    end
  end
end
