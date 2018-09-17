class UsersController < ApplicationController
  before_action :current_meetup, only: [:show, :directions, :cancel]

  def new
    @user = User.new

    # categories = ['Technology','TV','Business','Politics','Travel','Games','Movies','Theatre','Sports','Fashion']
    # categories.each do |c|
    #   interest = Interest.new(name: c)
    #   match = Interest.find_by(name: interest.name)
    #   p "did this save"
    #   p interest
    #   p "this didnt save"
    #   p match
    #   if !match
    #     interest.save
    #   end
    # end
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
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:age,:phone_number,:email,:password,:password_confirmation, :interests, interest_ids:[])
  end

  def current_meetup
    @current_meetup = Meetup.find_by(user_one: current_user.id)
    @current_meetup_joined = Meetup.find_by(user_two: current_user.id)
  end

end
