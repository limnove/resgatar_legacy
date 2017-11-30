# app/assets/javascripts/span/blocks/set_slide_notifications.js.coffee

$.setSlideNotifications = ->
  fn = $(".slideNotifications")
  if fn[0]
    return fn.delay(3000).slideUp(250)
  return
