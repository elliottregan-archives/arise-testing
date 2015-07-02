$(document).ready ->

  menuTimeouts = []

  $('.has_submenu').on {
    mouseenter: () ->
      menuItem = $(this)
      $(this).children('.submenu').addClass 'visuallyHidden'

      setTimeout (->
        console.log $(this), menuItem
        menuItem.children('.submenu').addClass 'visible'
      ), 20

      menuItem.children('.submenu').children('.header_link').each (i)->
        showMenuItem($(this), i)

    mouseleave: () ->
      $(this).children('.submenu').removeClass 'visible'
      $(this).children('.submenu').removeClass 'visuallyHidden'
      $(this).children('.submenu').children('li').removeClass 'visible'

      for menuTimeout in menuTimeouts
        window.clearInterval menuTimeout
  }

  showMenuItem = (header_link, n) ->
    menuTimeouts[n] = window.setInterval (->
      header_link.addClass 'visible'
    ), (100+30*n)

  $('.sidebar_toggle').on 'click', (e) ->
    e.preventDefault()
    $(this).siblings('.arrow_divider').toggleClass 'to_the_right'
    $('.slideaway_wrapper').toggleClass 'slide_away'