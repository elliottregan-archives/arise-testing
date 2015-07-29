$(document).ready ->

  # addContactToList = (formData)->
  #   console.log "clicky", formData
  #   # $("#footer-signup").submit()
  #
  #
  # $.ajax({
  #   type: "POST",
  #   url: "https://api.constantcontact.com/v2/contacts",
  #   data: {
  #     "first_name": "elliott"
  #   }
  #   # dataType: dataType
  # });

  $(".mobile_sidebar .header_link.has_submenu").click ->
    menuItem = $(this)

    if menuItem.hasClass "expanded"
      $(this).removeClass "expanded"
      menuItem.children('.submenu').removeClass 'visuallyHidden'

      setTimeout (->
        menuItem.children('.submenu').removeClass 'visible'
      ), 40
    else
      $(this).addClass "expanded"
      $(this).children('.submenu').addClass 'visuallyHidden'

      setTimeout (->
        menuItem.children('.submenu').addClass 'visible'
      ), 40

  $('.expander-trigger').click ->
    expander = $(this)
    expander.toggleClass 'visuallyHidden'

    setTimeout (->
      expander.toggleClass 'expander-hidden'
    ), 500

  $('.blog-sidebar').click ->
    console.log "clicky"
    $(this).toggleClass 'expanded'

  menuTimeouts = []

  $('.has_submenu:not(.mobile_submenu) ').on {
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
    $('body').toggleClass 'no-scroll'
