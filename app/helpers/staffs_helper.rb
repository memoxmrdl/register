module StaffsHelper
  def staffs_options(staffs)
    options_from_collection_for_select(staffs, 'id', 'name')
  end
end
