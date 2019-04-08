class CardsController < ApplicationController
  before_action :set_deck

  def index
    @cards = @deck.cards

    respond_to do |format|
      format.html {render 'index.html', :layout => false}
      format.js {render 'index.js', :layout => false}
    end
  end

  # def new
  #   @user = current_user
  #   @deck = Deck.find(session[:deck_id])
  #   @card = @deck.cards.build
  # end

  def create
    @card = @deck.cards.build(:name => params[:card][:name], :quantity => params[:card][:quantity])

    if @card.save
      render 'create.js', :layout => false
    else
      render "decks/show"
    end
  end

  def destroy
    card = Card.find(params[:id])
    @deck = Deck.find(card.deck_id)
    card.delete
    redirect_to user_deck_path(current_user, @deck)
  end

private
  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def card_params
    params.require(:cards).permit(:id, :name, :quantity, :deck_id)
  end
end
