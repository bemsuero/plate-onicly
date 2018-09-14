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
  
  def new
  @client = Yelp::Fusion::Client.new("#{ENV['API_TOKEN']}")
  @results = @client.search('New York City', term: 'restaurants')
  @text = @results.to_json
  @stuff = JSON.parse(@text)

  end

  def edit
  end

  def index
  end

  def show
  end


end
