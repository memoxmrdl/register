class Reports
  constructor: ->
    @initDateTimePickers()
    @initSelects()

  initDateTimePickers: ->
    $('#datetime-start_date, #datetime-end_date').datetimepicker
      format: 'DD/MM/YYYY'

    $('#datetime-hour').datetimepicker
      format: 'hh:mm'

  initSelects: ->
    $('.selectpicker').selectpicker()

App.Utils.Reports = Reports
