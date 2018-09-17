class UsersController < ApplicationController
  def new
    @user = User.new
    categories = ['Technology','TV','Business','Politics','Travel','Games','Movies','Theatre','Sports','Fashion']
    categories.each do |category|
      interest = Interest.new(name: category)
      match = Interest.find_by(name: interest.name)
      if !match
        interest.save
      end
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user
    else
      p @user.errors.messages
      render 'new'
    end
  end

  def edit
  end

  

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:age,:phone_number,:email,:password,:password_confirmation,interest_ids:[])

  end
end
