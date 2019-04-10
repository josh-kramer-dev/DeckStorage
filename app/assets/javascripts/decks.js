$(function(){
  $("#new_card").on("submit", function(e){
    e.preventDefault(e);
    //1. we need the URL to submit the POST request too
    url = this.action

    //2. we need the form data
    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
      'card': {
        'card_name': $("#card_name").val(),
        'card_quantity': $("#card_quantity").val()
      }
    };

    //low level
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      debugger
      success: function(response){
      }
    });

  });



  // $( "div.deck-form" ).submit(function (e) {
  //   e.preventDefault();
  //   console.log(this);
  // $("div.decks").append();
  // });


  $("a.load_deck").on('click', function(e) {
    e.preventDefault();
    $(this).parent().find("div").toggleClass("cards");
  });
})




//Send a POST request to the correct place that form would've gone to anyway
//along with the actual form data
