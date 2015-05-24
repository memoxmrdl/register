class SelectsPickers
  constructor: ->
    @selectLogbook()
    @selectOffice()

  selectLogbook: ->
    $('#select_logbook').selectpicker()

  selectOffice: ->
    $('.selectpicker').selectpicker()

App.Utils.SelectsPickers = SelectsPickers