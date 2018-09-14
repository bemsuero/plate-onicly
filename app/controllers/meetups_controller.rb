class MeetupsController < ApplicationController
      require 'yelp/fusion'
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
