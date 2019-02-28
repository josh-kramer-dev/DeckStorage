$(function(){
  $("a.load_deck").on('click', function(e) {
    e.preventDefault();
    $(this).parent().find("div").toggleClass("cards");
  });
})

// make a small form to add the card to the deck
