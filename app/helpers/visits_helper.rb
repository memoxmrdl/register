module VisitsHelper
  def select_offices(logbook)
    select_tag(
      'select_office',
      options_from_collection_for_select(@offices, 'id', 'name'),
      include_blank: true,
      title: 'Departamento',
      data: {
        'size' => '10',
        'width' => '100%',
        'id' => logbook.id
      },
      class: 'selectpicker select_office'
    )
  end

  def select_staff(logbook)
    select_tag('select_staff', '',
      include_blank: true,
      title: 'Staff',
      data: {
        'size' => '10',
        'width' => '100%'
      },
      id: "staff-#{logbook.id}",
      class: 'selectpicker'
    )
  end
end
