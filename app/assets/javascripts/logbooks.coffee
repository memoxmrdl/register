Photo = ->
  init: ->
    Photo.streaming    = false
    Photo.video  = document.querySelector('#video')
    Photo.canvas = document.querySelector('#canvas')
    width        = 480
    height       = 0

    navigator.getMedia = (navigator.getUserMedia ||
                         navigator.webkitGetUserMedia ||
                         navigator.mozGetUserMedia ||
                         navigator.msGetUserMedia)

    navigator.getMedia {
      video: true
      audio: false
    }, ((stream) ->
      if navigator.mozGetUserMedia
        Photo.video.mozSrcObject = stream
      else
        vendorURL = window.URL or window.webkitURL
        Photo.video.src = vendorURL.createObjectURL(stream)

      Photo.video.play()
    ), (err) ->
      console.log 'An error occured! ' + err
      return

    Photo.video.addEventListener 'canplay', ((ev) ->
      if !Photo.streaming
        height = Photo.video.videoHeight / (Photo.video.videoWidth / width)
        Photo.video.setAttribute 'width', width
        Photo.video.setAttribute 'height', height
        Photo.canvas.setAttribute 'width', width
        Photo.canvas.setAttribute 'height', height
        Photo.streaming = true
      return
    ), false

  stop: ->
    Photo.video.pause()
    Photo.video.src = ""

  takePhoto: ->
    Photo.canvas.width = width;
    Photo.canvas.height = height;
    Photo.canvas.getContext('2d').drawImage(video, 0, 0, width, height);
    console.info canvas.toDataURL('image/png');

App.Utils.Photo = Photo



