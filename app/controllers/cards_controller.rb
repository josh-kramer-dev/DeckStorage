class CardsController < ApplicationController
  def new
    @deck = Deck.find(params[:deck_id])
#deck_id isn't in the params. how am I going to make this deck work(and do I even need it in the first place?)

  end

  def create
    @card = Card.create(card_params)
  end

  def destroy
  end

private
  def card_params
    params.require(:cards).permit(:name, :quantity, :deck_id)
  end
end
