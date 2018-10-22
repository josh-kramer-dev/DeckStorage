$(function(){
  $(".show-deck").hide();
  $("a.load_deck").on('click', function(e){ //hijack the click event of selecting a deck
    e.preventDefault(); //prevent the move to the new page
    var deck = document.getElementById(this.id)
    console.log(deck)

    $(".table-cards").toggle(deck); //need to get it to only toggle the list for that particular deck
  });
})

    // $(".info").on('focus',function(){
    //   $(".infoDiv").hide(); // will need to do this so that when you click on a different deck it closes out the one that was previously opened.
    //   var id = $(this).attr('id');
    //   $("#div"+id).show();
    // });


//hijack the card delete button and use it to remove the card but stay on the page and take it off the DOM

//add deck id to each deck so that you can toggle just that one

// make a small form to add the card to the deck
