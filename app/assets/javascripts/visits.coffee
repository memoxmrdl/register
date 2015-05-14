class SelectsPickers
  constructor: ->
    @selectLogbook()
    @selectOffice()

  selectLogbook: ->
    $('#select_logbook').selectpicker()

  selectOffice: ->
    $('#select_office').selectpicker()

App.Utils.SelectsPickers = SelectsPickers