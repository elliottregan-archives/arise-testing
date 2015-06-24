$(document).ready ->

  console.log "jQuery ready"

  $('.has_submenu a').on 'click', (e) -> 
    e.preventDefault()
    console.log $(this).siblings('.submenu')
    $(this).siblings('.submenu').toggleClass 'visible'
