$(document).ready ->

  menuTimeouts = []

  $(':not(.mobile_sidebar) .has_submenu').on {
    mouseenter: () ->
      console.log "mouseon"
      menuItem = $(this)
      $(this).siblings('.header_link').addClass 'fade'
      $(this).children('.submenu').addClass 'visuallyHidden'

      setTimeout (->
        menuItem.children('.submenu').addClass 'visible'
      ), 40

      menuItem.children('.submenu').children('.header_link').each (i)->
        showMenuItem($(this), i)

    mouseleave: () ->
      console.log "mouseoff"
      menuItem = $(this)
      $(this).children('.submenu').removeClass 'visible'
      $(this).children('.submenu').children('.header_link').removeClass 'visible'
      $(this).siblings('.header_link').removeClass 'fade'

      setTimeout (->
        menuItem.children('.submenu').removeClass 'visuallyHidden'
      ), 10

      # setTimeout (->
      #   for menuTimeout in menuTimeouts
      #     window.clearInterval menuTimeout
      # ), 20
  }

  showMenuItem = (header_link, n) ->
    menuTimeouts[n] = window.setInterval (->
      header_link.addClass 'visible'
    ), (150+40*n)

  $('.sidebar_toggle').on 'click', (e) ->
    e.preventDefault()
    $(this).siblings('.arrow_divider').toggleClass 'to_the_right'
    $('.slideaway_wrapper').toggleClass 'slide_away'