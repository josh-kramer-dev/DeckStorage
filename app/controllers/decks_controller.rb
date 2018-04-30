class DecksController < ApplicationController

  def index
    @user = User.find_by(params[:user_id])
  end

  def show
    @deck = Deck.find_by(params[:id])
  end
end
