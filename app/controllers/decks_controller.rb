class DecksController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:index, :show]
  
  def index
  end

  def show
  end
end
