class Reports
  constructor: ->
    @initDateTimePickers()
    @initSelects()

  initDateTimePickers: ->
    $('#datetime-started-date, #datetime-ended-date').datetimepicker
      format: "YYYY-MM-DD HH:mm"

    $('#datetime-hour').datetimepicker
      format: 'hh:mm'

  initSelects: ->
    $('.selectpicker').selectpicker()

App.Utils.Reports = Reports
