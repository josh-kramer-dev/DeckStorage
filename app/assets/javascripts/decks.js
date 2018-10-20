$(function(){
  $(".button_to").hide();
  $(".table-cards").hide();
  $("a.load_deck").on('click', function(e){ //hijack the click event of selecting a deck
    e.preventDefault(); //prevent the move to the new page
    $.get(this.href).success(function(res){ //get the href from the click event

      $(".button_to").show(); //show the button. next step is to now add a form to the page for adding a card instead of a button that sends you to a new page.
      $(".table-cards").toggle(); //need to get it to only toggle the list for that particular deckjosh
      })
    });
  })


//hijack the card delete button and use it to remove the card but stay on the page and take it off the DOM

//add deck id to each deck so that you can toggle just that one

// make a small form to add the card to the deck
