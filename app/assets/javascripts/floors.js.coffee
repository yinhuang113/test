# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.switch-floor-plan').on 'click', (event) ->
    if $(this).text() == 'show'
      $(this).text('hide')
      $('.floor-plan').show()
    else
      $(this).text('show')
      $('.floor-plan').hide()
    event.preventDefault()
    
  $('.switch-triangulation').on 'click', (event) ->
    if $(this).text() == 'show'
      $(this).text('hide')
      $('.triangulation').show()
    else
      $(this).text('show')
      $('.triangulation').hide()
    event.preventDefault()
