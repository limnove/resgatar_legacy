# app/assets/javascripts/span/blocks/set_applications_menu.js.coffee

$.setApplicationsMenu = ->
  hb = $(".hamburgerBtn")
  am = $(".applicationsMenu")
  hb.click ->
    am.fadeToggle "slow"
    return
  return
