class SelectsPickers
  constructor: ->
    @selectLogbook()
    @selectOffice()
    @changeOfficeToStaffs()

  selectLogbook: ->
    $('#select_logbook').selectpicker()

  selectOffice: ->
    $('.selectpicker').selectpicker()

  changeOfficeToStaffs: ->
    $('.select_office').change (e) ->
      id = if $(@).val() != '' then $(@).val() else 'null'
      $.get "/logbooks/#{$(@).data('id')}/offices/#{id}/staffs"

App.Utils.SelectsPickers = SelectsPickers