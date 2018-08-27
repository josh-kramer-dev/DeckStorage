$(function(){
  $("a.load_deck").on('click', function(e){
    e.preventDefault();
    $.get(this.href).success(function(){
      debugger
        var $card =  $.get("div.deck-show").html();
        $("div.deck").html($card);
      })
    })
  })



//this works to display the name and quantities, but it's ugly
  // $(function(){
  //   $("a.load_deck").on('click', function(e){
  //     e.preventDefault();
  //     $.get(this.href).success(function(response){
  //       response.forEach(function(card){
  //         var $card =  "<li>" + card.name + " " + "    quantity: " + card.quantity + "</li>";
  //         $("div.deck ul").append($card);
  //         })
  //       })
  //     })
  //   })
