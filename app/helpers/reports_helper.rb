module ReportsHelper
  def datetime_tag(name, id, placeholder = '')
    name = name.to_s
    content_tag(:div, class: 'input-group date datetime-picker', id: id) do
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

  def count_current_register
    Visit.current_register.count
  end

  def office_more_visited
    Visit.more_visited(:office_id).map {|i| i.office.name }.join(', ')
  end

  def staff_more_visited
    Visit.more_visited(:staff_id).map {|i| i.staff.name }.join(', ')
  end

  def logbook_very_active
    Visit.more_visited(:logbook_id).map {|i| i.logbook.full_name }.join(', ')
  end
end
