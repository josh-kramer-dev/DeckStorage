$(function() {

  $.ajax({
    type: "GET",
    url: '/users/' + user_id + '/decks',
    success: function(resp){
      $(".decks").load("<%= escape_javascript (render :partial => 'decks/index') %>")
    }
  })

})
