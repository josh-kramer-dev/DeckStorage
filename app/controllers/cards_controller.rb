class CardsController < ApplicationController
  def new
    @user = current_user
    @deck = Deck.find(session[:deck_id])
    @card = @deck.cards.build
  end

  def create
    @deck = Deck.find(session[:deck_id])
    @card = @deck.cards.build(:name = params[:name], :quantity = params[:quantity])
    if @deck.save
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end

private
  def card_params
    params.require(:cards).permit(:name, :quantity, :deck_id)
  end
end
