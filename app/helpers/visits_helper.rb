module VisitsHelper
  def select_logbooks
    select_tag(
      'select_logbook',
      options_for_select(@logbooks.map { |logbook| [logbook.full_name, logbook.id,
        { 'data-photo' => image_url(logbook.photo.url), 'data-crendential' => image_url(logbook.credential.url) }]
      }),
      include_blank: true,
      title: 'Buscar visitante',
      data: {
        'live-search' => 'true',
        'size' => '10',
        'width' => '100%'
      }
    )
  end

  def select_offices
    select_tag(
      'select_office',
      options_from_collection_for_select(@offices, 'id', 'name'),
      include_blank: true,
      title: 'Buscar departamentos',
      data: {
        'live-search' => 'true',
        'size' => '10',
        'width' => '100%'
      }
    )
  end
end
