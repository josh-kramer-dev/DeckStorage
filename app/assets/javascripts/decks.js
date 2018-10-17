$(function(){
  $(".button_to").hide();
  $(".table-cards").hide();
  $("a.load_deck").on('click', function(e){ //hijack the click event of selecting a deck
    e.preventDefault(); //prevent the move to the new page
    $.get(this.href).success(function(res){ //get the href from the click event

      $("div.deck ul").html(""); //clear your target div
      $(".button_to").show(); //show the button. next step is to now add a form to the page for adding a card instead of a button that sends you to a new page.
      $(".table-cards").toggle(); //need to get it to only toggle the list for that particular deck
      })
    });
  })


  // res.forEach(function(card){ //iterate over the response data
  //   $("div.deck ul").append("<li>" + "<strong>" + card.name + "</strong>" + "<br>" + 'quantity: ' + card.quantity + "</li>"); //build the html string for the div
  //   });

    // $(".button_to").submit(function(e){  //need to change the button_to to a form instead so that I can get the data from the user without having to go to new_user_deck_card_path(user, deck)
    //
    //   $.get(this.href).success(function(res){
    //     ;
    // });
    //   // alert("target acquired");
    //   e.preventDefault();
    //   })
