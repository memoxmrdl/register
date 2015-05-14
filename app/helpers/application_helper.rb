module ApplicationHelper
  def title(title)
    content_for(:title) { "Registro : #{title}" }
  end
end
