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
