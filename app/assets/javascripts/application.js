//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require app
//= require logbooks
//= require bootstrap-select.min

$.fn.render_form_errors = function(errors){
  $form = this;
  this.clear_previous_errors();
  model = this.data('model');

  $.each(errors, function(field, messages){
    $input = $('input[name="' + model + '[' + field + ']"]');
    $input.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') );
  });
};

$.fn.clear_previous_errors = function(){
  $('.form-group.has-error', this).each(function(){
    $('.help-block', $(this)).html('');
    $(this).removeClass('has-error');
  });
}

function getBase64Image(imgElem) {
  if(imgElem.src.length >= 416534) {
    return imgElem.src
  } else {
    var canvas = document.createElement("canvas");
    canvas.width = imgElem.clientWidth;
    canvas.height = imgElem.clientHeight;
    var ctx = canvas.getContext("2d");
    ctx.drawImage(imgElem, 0, 0);
    var dataURL = canvas.toDataURL("image/png");
    console.info(imgElem)
    //return dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
    return dataURL;
  }
}