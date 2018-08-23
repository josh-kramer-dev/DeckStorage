$(function() {
// debugger
  $.ajax({
    type: "GET",
    url: '/decks/index',                   //'/users/' + user_id + '/decks',
    success: function(resp){
      $("div.decks").load("<%= escape_javascript (render :partial => 'decks/index') %>")
    }
  })

})
