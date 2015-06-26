$(document).ready ->

  console.log "jQuery ready"

  $('.has_submenu a').on 'click', (e) -> 
    e.preventDefault()
    $(this).siblings('.submenu').toggleClass 'visible'


  $('.sidebar_toggle').on 'click', (e) ->
    e.preventDefault()
    console.log "clicky"
    $(this).siblings('.arrow_divider').toggleClass 'to_the_right'
    $('.slideaway_wrapper').toggleClass 'slide_away'