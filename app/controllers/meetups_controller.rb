class MeetupsController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'httparty'


  def new
    @meetup = Meetup.new
    location = params[:location]
    uri = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7079996,-74.0067468&rankby=distance&type=restaurant&key=#{ENV['API_TOKEN']}")
    raw_data = HTTParty.get(url)
    # if @raw_data.is_a?(Net::HTTPSuccess)
    json = raw_data.parsed_response
    @moreresults = json["next_page_token"]
    @places = json["results"]
    # else
  end
  # end



  def edit
  end

  def index
  end

  def show
  end
end
