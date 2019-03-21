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

  # def update
  #   @deck = Deck.find(session[:deck_id])
  #   respond_to do |format|
  #     if @deck.save
  #       format.html { redirect_to user_deck_path(current_user, @deck), notice: 'Deck was successfully created.' }
  #       format.json { render :show, status: :created, location: @deck }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @deck.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
