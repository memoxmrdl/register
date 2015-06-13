class Reports
  constructor: ->
    @initDateTimePickers()
    @initSelects()

  initDateTimePickers: ->
    $('#datetime-start_date, #datetime-end_date').datetimepicker
      format: "YYYY-MM-DD HH:mm A"

    $('#datetime-hour').datetimepicker
      format: 'hh:mm'

  initSelects: ->
    $('.selectpicker').selectpicker()

App.Utils.Reports = Reports
