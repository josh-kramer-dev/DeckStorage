$(function(){
  $("a.load_deck").on('click', function(e) {
    e.preventDefault();
    $(this).parent().find("div").toggleClass("cards");
  });

  // $( "div.deck-form" ).submit(function (e) {
  // e.preventDefault();
  // $("div.decks").append("new deck");
  // });
  //target works, now need to use jQuery to instatiate a new deck and figure out how to add cards to it.
})
