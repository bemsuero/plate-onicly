class MeetupsController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'httparty'
  require 'yelp/fusion'

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
  @meetup = Meetup.new
  @client = Yelp::Fusion::Client.new("99uhaoGtL2nGG5okFnRrDIqjL38zu0djkdZbsQcKXQisixYIbnxzDhHSs3O3nQ3l7Y2CacILy6CJWkiDeNxJ_wWhGZ8HRxudobFUtZ5a8t-LQ1D1UlsjdTZKDsCaW3Yx")
  @results = @client.search('New York City', term: 'restaurants')
  @yelp_response = JSON.parse(@results.to_json)
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user_one = @current_user.id
    @meetup.location = params[:location]
    @meetup.meet_time = params[:meet_time]
    if @meetup.save
      redirect_to @meetup
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
    @random_meetup = Meetup.find_by("1")
    p @random_meetup
    @random_meetup.user_two = current_user.id
    p @random_meetup
    @random_meetup.save
    redirect_to @random_meetup
  end

    def directions
      house = params[:house_number]
      address = params[:address]
      city = params[:city]
      state = params[:state]
      to_house = params[:to_house_number]
      to_address = params[:to_address]
      to_city = params[:to_city]
      to_state = params[:to_state]
      redirect_to "https://www.google.com/maps/dir/?api=1&origin=#{house}+#{address}+#{city}+#{state}&destination=#{to_house}+#{to_address}+#{to_city}+#{to_state}&travelmode=walking"
    end

  private

  def meetup_params
    params.require(:meetup).permit(:user_one, :meet_time, :location)
  end

end
