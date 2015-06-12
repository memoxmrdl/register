module ReportsHelper
  def datetime_tag(name, placeholder = '')
    name = name.to_s
    content_tag(:div, class: 'input-group date datetime-picker', id: "datetime-#{name}") do
      content = text_field_tag(name, '', class: 'form-control', placeholder: placeholder)
      content << content_tag(:span, class: 'input-group-addon') do
        content_tag(:span, '', class: 'glyphicon glyphicon-calendar')
      end 
    end
  end

  def selectpicker_tag(resource, name, value, title)
    select_tag(
      "#{name}",
      options_from_collection_for_select(resource, 'id', value),
      include_blank: true,
      title: title,
      data: {
        'size' => '10',
        'width' => '100%',
      },
      class: 'selectpicker'
    )
  end
end
