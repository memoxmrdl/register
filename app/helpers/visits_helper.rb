module VisitsHelper
  def select_offices
    select_tag(
      'select_office',
      options_from_collection_for_select(@offices, 'id', 'name'),
      include_blank: true,
      title: 'Departamento',
      data: {
        'size' => '10',
        'width' => '100%'
      },
      class: 'selectpicker '
    )
  end

  def select_staff
    select_tag('select_staff', '',
      include_blank: true,
      title: 'Staff',
      data: {
        'size' => '10',
        'width' => '100%'
      },
      class: 'selectpicker '
    )
  end
end
