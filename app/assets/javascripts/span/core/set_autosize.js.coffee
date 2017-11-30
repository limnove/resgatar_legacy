# app/assets/javascripts/span/core/set_autosize.js.coffee

$.setAutosize = ->
  as = $(".autosize")
  if as[0]
    autosize document.querySelectorAll(".autosize")
  return
