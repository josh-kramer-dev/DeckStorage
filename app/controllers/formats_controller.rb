class FormatsController < ApplicationController

def show
  @formats = Format.all
  @format = Format.find(params[:id])
  @user = current_user
  @decks = @user.decks.filter_by_format(params[:id])
end


end
