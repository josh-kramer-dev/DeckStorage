class DecksController < ApplicationController

  def index
    @user = User.find_by(params[:user_id])
    @deck = Deck.new
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
  end

  def edit
  end

  def update
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.delete

    redirect_to user_path(current_user)
  end

  private
  def deck_params
    params.require(:decks).permit(:name, :user_id, :deck_id)
  end

end
