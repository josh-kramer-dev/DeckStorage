class DecksController < ApplicationController

  def index
    @user = User.find_by(params[:user_id])
  end

  def show
    if !current_user
      redirect_to user_path(current_user)
    end

    @deck = Deck.find(params[:id])

    session[:deck_id] = @deck.id
  end

  def new
    @deck = current_user.decks.build
    @user = current_user
  end

  def create

    @deck = current_user.decks.build(:name => params[:name])

    if @deck.save
      redirect_to user_deck_path(current_user, @deck)
    end

    ##need to put the redirect in for errors if the deck doesn't save ##
  end

  private
  def deck_params
    params.require(:decks).permit(:name, :user_id, :deck_id)
  end

end
