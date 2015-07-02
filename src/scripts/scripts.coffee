$(document).ready ->

  menuTimeouts = []

  $('.has_submenu').on {
    mouseenter: () ->
      menuItem = $(this)
      $(this).children('.submenu').addClass 'visuallyHidden'

      setInterval (->
        menuItem.children('.submenu').addClass 'visible'
      ), 20

      menuItem.children('.submenu').children('.header_link').each (->
        console.log $(this)
        showMenuItem($(this).children('.submenu'), index)
      )

    mouseleave: () ->
      $(this).children('.submenu').removeClass 'visible'
      $(this).children('.submenu').removeClass 'visuallyHidden'
      $(this).children('.submenu').children('li').removeClass 'visible'

      for menuTimeout in menuTimeouts
        window.clearInterval menuTimeout
  }

  showMenuItem = (parentList, n) ->
    menuTimeouts[n] = window.setInterval (->
      console.log n, parentList.children('.header_link').slice(n)
      parentList.children('.header_link').slice(n).addClass 'visible'
    ), (40+100*n)

  $('.sidebar_toggle').on 'click', (e) ->
    e.preventDefault()
    console.log "clicky"
    $(this).siblings('.arrow_divider').toggleClass 'to_the_right'
    $('.slideaway_wrapper').toggleClass 'slide_away'