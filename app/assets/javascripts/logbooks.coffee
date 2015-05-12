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

    $('.cancelWebCam').on 'click', (e) ->
      localMediaStream.stop()

    $('#takePhoto').on 'click', ->
      canvas.width = width
      canvas.height = height
      canvas.getContext('2d').drawImage(video, 0, 0, width, height)
      dataURL = canvas.toDataURL('image/png')
      $("#logbook_photo_preview").attr('src', dataURL)

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

    $('.cancelWebCam').on 'click', (e) ->
      localMediaStream.stop()

    $('#takeCredential').on 'click', ->
      canvas.width = width
      canvas.height = height
      canvas.getContext('2d').drawImage(video, 0, 0, width, height)
      dataURL = canvas.toDataURL('image/png')
      $("#logbook_credential_preview").attr('src', dataURL)

App.Utils.CamWebCredential = CamWebCredential
