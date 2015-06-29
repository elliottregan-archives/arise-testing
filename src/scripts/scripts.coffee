$(document).ready ->

  console.log "jQuery ready"

  $('.has_submenu a').on 'mouseover', (e) -> 
    # e.preventDefault()
  
  $('.has_submenu').on {
    mouseenter: () ->
      menuItem = $(this)
      menuItem.children('.submenu').addClass 'visuallyHidden'

      setTimeout (->
        menuItem.children('.submenu').addClass 'visible'
      ), 20

      setTimeout (->
        menuItem.children('.submenu').children('.header_link').addClass 'visible'
      ), 40

    mouseleave: () ->
      $(this).children('.submenu').removeClass 'visible'
      $(this).children('.submenu').removeClass 'visuallyHidden'
      $(this).children('.submenu').children('li').removeClass 'visible'
  }

  $('.sidebar_toggle').on 'click', (e) ->
    e.preventDefault()
    console.log "clicky"
    $(this).siblings('.arrow_divider').toggleClass 'to_the_right'
    $('.slideaway_wrapper').toggleClass 'slide_away'