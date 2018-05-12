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
    @deck = Deck.find(params[:id])
    card = Card.find(params[:card_id])

    # card.delete
    delete_card

    redirect_to user_deck_path(current_user, @deck)
  end

private
  # def card_params
  #   params.require(:cards).permit(:name, :quantity, :deck_id, :card_id, :id)
  # end
  #
  # def delete_card
  #   session[:card_id] = nil
  # end
end
