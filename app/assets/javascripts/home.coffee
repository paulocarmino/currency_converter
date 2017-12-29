$(document).ready ->
  currency = $('#currency');
  currency_destination = $("#currency_destination");

  $('#quantity').val('');
  $('#result').val('');

  if $(window).width() < '599'
      $('#body-section').removeClass 'is-fullheight'
      $('.refresh').addClass 'refresh-mobile'

  if $(window).width() > '600'
      $('.refresh').removeClass 'refresh-mobile'

  $('#quantity').keyup (event) ->
    if event.keyCode == 13
      $('.button-exchange').click()
    return false;

  $('.icon').click ->
    $('.refresh').toggleClass('spin');
    currency.data('prev', currency.val());
    currency_destination.data('prev', currency_destination.val());
    currency.val(currency_destination.val());
    currency_destination.val(currency.data('prev'));
    
  $('.button-exchange').click ->
    $('.spinner').show();
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
        type: 'POST'
        dataType: 'json'
        data: {
          currency: currency.val(),
          currency_destination: currency_destination.val(),
          quantity: $("#quantity").val()
        }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
          $('.spinner').hide();          
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
          $('.spinner').hide();            
      return false;