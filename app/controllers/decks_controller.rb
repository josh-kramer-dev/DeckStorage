class DecksController < ApplicationController
  before_action :set_deck, only:[:show, :edit, :update, :destroy]

  def index
    @user = User.find_by(params[:user_id])
    @deck = Deck.new

    if params[:format_id]
      @decks = @decks.filter_by_format(params[:format_id])
    else
      @decks = @user.decks
    end
  end

  def show
    if !current_user
      redirect_to user_path(current_user)
    end

    @cards = @deck.cards.all
    session[:deck_id] = @deck.id

    respond_to do |format|
    format.json { render json: @deck }
    format.html { render :show}
    end
  end

  def new
    @deck = current_user.decks.build
    @user = current_user
  end

  def create

    @deck = current_user.decks.build(:name => params[:name], :format_id => params[:format_id])
    if @deck.save
      redirect_to user_path(current_user)
    end
      respond_to do |format|
        if @deck.save
          format.html { redirect_to user_path(current_user), notice: 'Deck was successfully created.' } and return
          format.json { render :show, status: :created, location: @deck }
        else
          format.html { render :new }
          format.json { render json: @deck.errors, status: :unprocessable_entity }
        end
      end
    end

  def edit
  end

  def update
    respond_to do |format|
      if @deck.save
        format.html { redirect_to user_deck_path(current_user, @deck), notice: 'Deck was successfully created.' }
        format.json { render :show, status: :created, location: @deck }
      else
        format.html { render :new }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @deck.delete
    redirect_to user_path(current_user)
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end


  def deck_params
    params.require(:decks).permit(:name, :user_id, :deck_id, :format_id)
  end
end
