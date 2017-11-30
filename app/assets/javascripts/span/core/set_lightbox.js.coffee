# app/assets/javascripts/span/core/set_autosize.js.coffee

$.setLightbox = ->
  lb = $(".filePreview")
  if lb[0]
    lightbox.option
      "resizeDuration": 200
      "wrapAround": true
  return
