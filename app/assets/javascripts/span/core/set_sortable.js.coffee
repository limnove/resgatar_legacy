# app/assets/javascripts/span/core/set_sortable.js.coffee

$.setSortable = ->
  st = $(".sortable")
  if st[0]
    return st.sortable(
      option: "grid"
      handle: ".handle"
      revert: false
      scroll: true
      update: ->
        $.post $(this).data("update-url"), $(this).sortable("serialize")
    )
  return
