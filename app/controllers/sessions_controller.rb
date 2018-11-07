class SessionsController < ApplicationController
  def new
  end

  def create_guest

  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      p "This is for Debugging User DB Tables"
      p @user
      redirect_to @user
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    log_out if logged_in?
    redirect_to root_path
  end
end
