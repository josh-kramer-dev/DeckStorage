class CardsController < ApplicationController

  def new
    @user = current_user
    @deck = Deck.find(session[:deck_id])
    @card = @deck.cards.build
  end

  def create
    @deck = Deck.find(session[:deck_id])
    @card = @deck.cards.build(:name => params[:card][:name], :quantity => params[:card][:quantity])

    if @deck.save
      redirect_to user_deck_path(current_user, @deck)
    end
  end

  def destroy
    @deck = Deck.find(session[:deck_id])
#need to somehow get the card_id when you click the delete button
    # @card = Card.find(params[:id])
    # @card.delete

    redirect_to user_deck_path(current_user, @deck)
  end

private
  def card_params
    params.require(:cards).permit(:name, :quantity, :deck_id)
  end
end
