class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      p @user #for debugging
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:age,:phone_number,:email,:password,:password_confirmation,:interests)
  end
end
