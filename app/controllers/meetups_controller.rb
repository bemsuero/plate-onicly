class MeetupsController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'httparty'
  require 'yelp/fusion'
  before_action :current_meetup, only: [:new, :show, :directions, :cancel, :leave]

  def new
  if @current_meetup != nil || @current_meetup_joined != nil
    redirect_to root_path
  else
    @eat_area = params[:eat_area]
    if @eat_area == nil
    else
  @meetup = Meetup.new
  @client = Yelp::Fusion::Client.new("99uhaoGtL2nGG5okFnRrDIqjL38zu0djkdZbsQcKXQisixYIbnxzDhHSs3O3nQ3l7Y2CacILy6CJWkiDeNxJ_wWhGZ8HRxudobFUtZ5a8t-LQ1D1UlsjdTZKDsCaW3Yx")
  @results = @client.search("#{@eat_area}", term: 'restaurants')
  @yelp_response = JSON.parse(@results.to_json)
  end
  end
  end

  def create
    @meetup = Meetup.new(meetup_params)
    if @meetup.save
        redirect_to meetups_path
    else
      render "new"
    end
  end

  def edit
  end

  def index
  end

  def show
  end

  def random
    if @current_meetup != nil || @current_meetup_joined != nil
      redirect_to root_path
    else
    random = User.all.ids.shuffle[0]
    current_meetup = Meetup.find_by(random.to_s)
    if current_meetup.user_two == nil && current_meetup.user_one != current_user.id
    current_meetup.user_two = current_user.id
    current_meetup.save
    redirect_to current_user
  else
    redirect_to root_path
  end
  end
  end

  def cancel
    @current_meetup.destroy
    redirect_to current_user
  end

  def leave
    @current_meetup_joined.user_two = nil
    @current_meetup_joined.save
      redirect_to current_user
    end

    def directions
      house = params[:house_number]
      address = params[:address]
      city = params[:city]
      state = params[:state]
      if @current_meetup != nil
      redirect_to "https://www.google.com/maps/dir/?api=1&origin=#{house}+#{address}+#{city}+#{state}&destination=#{@current_meetup.location}&travelmode=walking"
    elsif @current_meetup_joined != nil
      redirect_to "https://www.google.com/maps/dir/?api=1&origin=#{house}+#{address}+#{city}+#{state}&destination=#{@current_meetup_joined.location}&travelmode=walking"
    else
      redirect_to current_user
    end
    end

  private

  def meetup_params
    params.require(:meetup).permit(:user_one, :meet_date, :meet_time, :location, :location_name)
  end

  def current_meetup
    # @current_meetup = Meetup.find_by(user_one: current_user.id)
    # @current_meetup_joined = Meetup.find_by(user_two: current_user.id)
  end

end
