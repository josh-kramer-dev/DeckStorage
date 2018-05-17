class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]
  helper_method :user_has_errors

  def new
    @user = User.new
  end

  def create
    if params[:name] #if the login button is clicked, use the regular login process
      @user = User.find_by(:name => params[:name])
      if !user_has_errors(@user) && !@user.nil?
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash.now[:alert] = "Invalid username or password"
        @user = User.new
        render :new
      end
    else
      @user = User.find_or_create_by_facebook(auth_hash) # login via facebook API
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_has_errors(user)
    if !user.nil? && user.valid?
      return user.errors.any?
    end
  end

end
