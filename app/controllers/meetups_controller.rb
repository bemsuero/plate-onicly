class MeetupsController < ApplicationController
require 'net/http'
require 'uri'
require 'json'


  def new
    @meetup = Meetup.new
    location = params[:location]
    # uri = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7079996,-74.0067468&rankby=distance&type=restaurant&key=#{ENV['API_TOKEN']}") what we'll actually be using.
    uri = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7079996,-74.0067468&rankby=distance&type=restaurant&key=AIzaSyCk6eRqZiFhkKrymT8EUR21OZ4Jf2J9Xgs")
    raw_data = Net::HTTP.get(uri)
    # if @raw_data.is_a?(Net::HTTPSuccess)
    @places = JSON.parse(raw_data)

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
