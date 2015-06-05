module ApplicationHelper
  def title(title)
    content_for(:title) { "Registro : #{title}" }
  end

  def link_to_back
    link_to 'Regresar', :back
  end
end
