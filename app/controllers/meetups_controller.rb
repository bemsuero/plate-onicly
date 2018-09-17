class MeetupsController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'httparty'
  require 'yelp/fusion'
  before_action :current_meetup, only: [:show, :directions, :cancel]

#   def new
#     @meetup = Meetup.new
#     location = params[:location]
#     # uri = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7079996,-74.0067468&rankby=distance&type=restaurant&key=#{ENV['API_TOKEN']}")
#     uri = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7079996,-74.0067468&rankby=distance&type=restaurant&key=AIzaSyCk6eRqZiFhkKrymT8EUR21OZ4Jf2J9Xgs")
#     raw_data = HTTParty.get(uri)
#     json = raw_data.parsed_response
#     @places = json["results"]
#   end


  def new
  @user = current_user
  @meetup = Meetup.new
  @client = Yelp::Fusion::Client.new("99uhaoGtL2nGG5okFnRrDIqjL38zu0djkdZbsQcKXQisixYIbnxzDhHSs3O3nQ3l7Y2CacILy6CJWkiDeNxJ_wWhGZ8HRxudobFUtZ5a8t-LQ1D1UlsjdTZKDsCaW3Yx")
  @results = @client.search('New York City', term: 'restaurants')
  @yelp_response = JSON.parse(@results.to_json)
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user_one = current_user.id
    if @meetup.save
      redirect_to root_path
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
    random = User.all.ids.shuffle[0]
    current_meetup = Meetup.find_by(random.to_s)
    if current_meetup.user_two == nil
    current_meetup.user_two = current_user.id
    current_meetup.save
    redirect_to current_user
  else
    redirect_to root_path
  end
  end

  def cancel
    @current_meetup.destroy
    redirect_to root_path
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
      redirect_to root_path
    end
    end

  private

  def meetup_params
    params.require(:meetup).permit(:user_one, :meet_date, :meet_time, :location)
  end

  def current_meetup
    @current_meetup = Meetup.find_by(user_one: current_user.id)
    @current_meetup_joined = Meetup.find_by(user_two: current_user.id)
  end

end
