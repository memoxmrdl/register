class FormLogbook
  constructor: ->
    $('#new_logbook').submit ->
      $form = $(@)

      $.ajax
        dataType: 'json'
        method: $form.attr('method')
        url: $form.attr('action')
        data:
          logbook:
            first_name: $('#logbook_first_name').val()
            second_name: $('#logbook_second_name').val()
            photo: $('#logbook_photo_preview').attr('src')
            credential: $('#logbook_credential_preview').attr('src')
      .done (data) ->
        window.location = '/logbooks'

      return false

    $('.edit_logbook').submit ->
      $form = $(@)

      if $('#logbook_photo_preview').attr('src') != ''
        photo = getBase64Image(document.getElementById('logbook_photo_preview'))

      if $('#logbook_credential_preview').attr('src') != ''
        credential = getBase64Image(document.getElementById('logbook_credential_preview'))

      $.post $form.attr('action'), {
        '_method':'put'
        'logbook[first_name]': $('#logbook_first_name').val()
        'logbook[second_name]': $('#logbook_second_name').val()
        'logbook[photo]': photo
        'logbook[credential]': credential
      },(data) ->
        window.location = '/logbooks'

      return false

  submit = ->
    $form = $(@)

    if $('#logbook_photo_preview').attr('src') != ''
      photo = convertImgToBase64($('#logbook_photo_preview').attr('src'))

    if $('#logbook_credential_preview').attr('src') != ''
      credential = convertImgToBase64($('#logbook_credential_preview').attr('src'))

    data =
      logbook:
        first_name: $('#logbook_first_name').val()
        second_name: $('#logbook_second_name').val()
        photo: photo
        credential: credential

    $.ajax
      dataType: 'json'
      method: $form.attr('method')
      url: $form.attr('action')
      data: data
    .done (data) ->
      window.location = '/logbooks'

    return false

App.Utils.FormLogbook = FormLogbook

CamWebPhoto = ->
  init: (item) ->
    streaming = false
    video = document.querySelector('#videoPhoto')
    canvas = document.querySelector('#canvasPhoto')
    stream = null
    width = 480
    height = 0
    localMediaStream = null
    name = item

    navigator.getMedia = (navigator.getUserMedia ||
                         navigator.webkitGetUserMedia ||
                         navigator.mozGetUserMedia ||
                         navigator.msGetUserMedia)

    navigator.getMedia {
      video: true
      audio: false
    }, ((stream) ->
      if navigator.mozGetUserMedia
        video.mozSrcObject = stream
      else
        vendorURL = window.URL or window.webkitURL
        video.src = vendorURL.createObjectURL(stream)

      localMediaStream = stream
      video.play()
    ), (err) ->
      console.log 'An error occured! ' + err
      return

    video.addEventListener 'canplay', ((ev) ->
      if !streaming
        height = video.videoHeight / (video.videoWidth / width)
        video.setAttribute 'width', width
        video.setAttribute 'height', height
        canvas.setAttribute 'width', width
        canvas.setAttribute 'height', height
        streaming = true
      return
    ), false

    $('#camwebPhoto').on 'hide.bs.modal', (e) ->
      localMediaStream.stop()
      $('.againWebCam').hide()
      $('.saveWebCam').hide()
      $('#takePhoto').show()
    .on 'show.bs.modal', (e) ->
      video.src = ''

    $('.againWebCam').on 'click', (e) ->
      video.play()
      $('.againWebCam').hide()
      $('.saveWebCam').hide()
      $('#takePhoto').show()

    $('.saveWebCam').on 'click', (e) ->
      canvas.width = width
      canvas.height = height
      canvas.getContext('2d').drawImage(video, 0, 0, width, height)
      dataURL = canvas.toDataURL('image/png')
      $("#logbook_photo_preview").attr('src', dataURL)
      $('#camwebPhoto').modal('hide')

    $('#takePhoto').on 'click', ->
      video.pause()
      $('.againWebCam').show()
      $('.saveWebCam').show()
      $('#takePhoto').hide()


App.Utils.CamWebPhoto = CamWebPhoto

CamWebCredential = ->
  init: (item) ->
    streaming = false
    video = document.querySelector('#videoCredential')
    canvas = document.querySelector('#canvasCredential')
    stream = null
    width = 480
    height = 0
    localMediaStream = null
    name = item

    navigator.getMedia = (navigator.getUserMedia ||
                         navigator.webkitGetUserMedia ||
                         navigator.mozGetUserMedia ||
                         navigator.msGetUserMedia)

    navigator.getMedia {
      video: true
      audio: false
    }, ((stream) ->
      if navigator.mozGetUserMedia
        video.mozSrcObject = stream
      else
        vendorURL = window.URL or window.webkitURL
        video.src = vendorURL.createObjectURL(stream)

      localMediaStream = stream
      video.play()
    ), (err) ->
      console.log 'An error occured! ' + err
      return

    video.addEventListener 'canplay', ((ev) ->
      if !streaming
        height = video.videoHeight / (video.videoWidth / width)
        video.setAttribute 'width', width
        video.setAttribute 'height', height
        canvas.setAttribute 'width', width
        canvas.setAttribute 'height', height
        streaming = true
      return
    ), false

    $('#camwebCredential').on 'hide.bs.modal', (e) ->
      localMediaStream.stop()
      $('.againWebCam').hide()
      $('.saveWebCam').hide()
      $('#takeCredential').show()
    .on 'show.bs.modal', (e) ->
      video.src = ''

    $('.againWebCam').on 'click', (e) ->
      video.play()
      $('.againWebCam').hide()
      $('.saveWebCam').hide()
      $('#takeCredential').show()

    $('.saveWebCam').on 'click', (e) ->
      canvas.width = width
      canvas.height = height
      canvas.getContext('2d').drawImage(video, 0, 0, width, height)
      dataURL = canvas.toDataURL('image/png')
      $("#logbook_credential_preview").attr('src', dataURL)
      $('#camwebCredential').modal('hide')

    $('#takeCredential').on 'click', ->
      video.pause()
      $('.againWebCam').show()
      $('.saveWebCam').show()
      $('#takeCredential').hide()


App.Utils.CamWebCredential = CamWebCredential


$(document).ready ->
  $(document).bind 'ajaxError', 'form#new_logbook', (event, jqxhr, settings, exception) ->
    $(event.data).render_form_errors $.parseJSON(jqxhr.responseText)
    return
  return