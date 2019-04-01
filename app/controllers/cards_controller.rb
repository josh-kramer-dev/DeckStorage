class CardsController < ApplicationController

  def new
    @user = current_user
    @deck = Deck.find(session[:deck_id])
    @card = @deck.cards.build
  end

  def create
    @deck = Deck.find(session[:deck_id])
    @card = @deck.cards.build(card_params)

# this logic causes the page to refresh after every new card instead of staying on the page
    if @deck.save
      redirect_to user_deck_path(current_user, @deck)
    end
  end

  def destroy
    card = Card.find(params[:id])
    @deck = Deck.find(card.deck_id)
    card.delete
    redirect_to user_deck_path(current_user, @deck)
  end

private
  def card_params
    params.require(:cards).permit(:id, :name, :quantity, :deck_id)
  end
end
