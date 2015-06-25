$(document).ready ->

  console.log "jQuery ready"

  $('.has_submenu a').on 'click', (e) -> 
    e.preventDefault()
    $(this).siblings('.submenu').toggleClass 'visible'


  $('.header_toggle').on 'click', (e) ->
    e.preventDefault()
    console.log "clicky"
    $(this).siblings('.arrow_divider').toggleClass 'right'
