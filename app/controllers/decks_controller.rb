class DecksController < ApplicationController

  def index
    @user = User.find_by(params[:user_id])
  end

  def show
    if !current_user
      redirect_to user_path(current_user)
    end

    @deck = Deck.find(params[:id])
  end

  def new
  end

  def create
  end
  
end
