module ArticlesHelper
  def articles_proc
    lambda do |day|
      if Article.has_events_on?(day)
          [link_to(day.day, articles_du_jour_path(day)), {}]
      else
          day.day
      end
    end
  end
  
  def has_photo?(article)
    if article.photo.url != "/photos/original/missing.png"
      return true
    else
      return false
    end
  end
end
