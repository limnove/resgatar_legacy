# app/assets/javascripts/span/core/set_anchor.js.coffee

$.setAnchor = ->
  ac = $(".off")
  if ac[0]
    return ac.on("click", (e) ->
      e.preventDefault()
    )
  return
