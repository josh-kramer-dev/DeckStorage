class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    @user = User.new
  end

  def create
    # byebug


    if params[:name]
      if params[:name].empty?
        @user = User.new
        render :new
      else
    	   @user = User.find_by(:name => params[:name])
      end
    else
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(9)
      end
    end

    if @user.save
    	session[:user_id] = @user.id
    	redirect_to user_path(@user)
    # else
    # 	render :new
    end

    # @user = User.new
    # if params[:name].empty?
    #  render :new
    # end

    # if
      # @user = User.find_or_create_by(uid: auth['uid']) do |u|
      #   u.name = auth['info']['name']
      #   u.email = auth['info']['email']
      #   u.password = SecureRandom.hex(9)
      #   end
    # else
    #   params[:name] && !params[:name].empty?
    #   if User.find_by(:name => params[:name])
    #      @user = User.find_by(:name => params[:name])
    #    else
    #      redirect_to 'sessions/new'
    #    end
    #
    # end

      # session[:user_id] = @user.id
      # redirect_to user_path(@user)

  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
