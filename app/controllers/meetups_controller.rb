class MeetupsController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'httparty'
  require 'yelp/fusion'
  before_action :current_meetup, only: [:cancel, :leave]
  before_action :current_meetup_slug, only: [:show, :directions]

  def new
    if current_user == nil
      @eat_area = params[:eat_area]
      session[:location] = @eat_area
    unless @eat_area != nil
    else
        @meetup = Meetup.new
        @client = Yelp::Fusion::Client.new("z_VWpGhFnlmF-o3D4Q9WOaKJn8UxTPjZkA6ntFoNyoXegUVTtw1L9vOT2o9EDOJo369oYIood2H34v80V03ZVTqEJmW9u2vMPXXLbpeXaMG_aF0hjNI_6F-Vd0ehW3Yx")
        @results = @client.search("#{@eat_area}", term: 'restaurants')
        @yelp_response = JSON.parse(@results.to_json)
end
elsif
    @eat_area = params[:eat_area]
    session[:location] = @eat_area
  if @eat_area == nil
    else
    @user = current_user
    @meetup = Meetup.new
    @client = Yelp::Fusion::Client.new("z_VWpGhFnlmF-o3D4Q9WOaKJn8UxTPjZkA6ntFoNyoXegUVTtw1L9vOT2o9EDOJo369oYIood2H34v80V03ZVTqEJmW9u2vMPXXLbpeXaMG_aF0hjNI_6F-Vd0ehW3Yx")
    @results = @client.search("#{@eat_area}", term: 'restaurants')
    @yelp_response = JSON.parse(@results.to_json)
  end
  end
end
    # elsif @current_meetup != nil || @current_meetup_joined != nil
    #   redirect_to root_path

  #     end
  # end
  # end

  def create
    if current_user == nil
      @meet_date = params[:meet_date]
      @meet_time = params[:meet_time]
      @location = params[:location]
      @location_name = params[:location_name]
      @meetup = Meetup.new(
        meet_date: @meet_date,
        meet_time: @meet_time,
        location: @location,
        location_name: @location_name,
        guest_user: GuestUser.new)
      p "creating guest user..."
      session[:destination_address] = @location
      if @meetup.save
      guest = GuestUser.create(name: params["meetup"]["name"],
                            phone: params["meetup"]["phone"],
                            email: params["meetup"]["email"]) #create and validate is the correct way
      p "guest user created"
      GuestUserMailer.confirmation_email(guest).deliver_now
      @meetup.guest_user_id = guest.id
      @meetup.generate_slug
      redirect_to("/meetup/#{@meetup.slug}")
    # elsif
    # @meetup = Meetup.new(meetup_params)
    # @meetup.user_one = current_user.id
    #     redirect_to current_user
    else
      p @meetup.errors.messages
      p "creating guest user failed"
      render "new"
    end
  end
  end

  def edit
  end

  def index
  end

  def show
        @meetup = Meetup.find_by(slug: params[:slug])
  end

  def random
    if current_user == nil
      all = Meetup.all
      only_guest_meetup = all.where(joiner_id: nil).shuffle[0]
      guest = GuestUser.create(name: params["meetup"]["name"],
                            phone: params["meetup"]["phone"],
                            email: params["meetup"]["email"])
    only_guest_meetup.joiner_id = guest.id
    only_guest_meetup.save

    joining_user = GuestUser.find(only_guest_meetup.joiner_id)
    creator_user = GuestUser.find(only_guest_meetup.guest_user_id)

    creator_emailinfo = {:email => creator_user.email,:location => only_guest_meetup.location,:meet_time => only_guest_meetup.meet_time,:meet_date => only_guest_meetup.meet_date,:location_name => only_guest_meetup.location_name}
    joiner_emailinfo = {:email => joining_user.email,:location => only_guest_meetup.location,:meet_time => only_guest_meetup.meet_time,:meet_date => only_guest_meetup.meet_date,:location_name => only_guest_meetup.location_name}

    GuestUserMailer.join_email(creator_emailinfo).deliver_now
    GuestUserMailer.join_email(joiner_emailinfo).deliver_now

    redirect_to("/meetup/#{only_guest_meetup.slug}")
  else
    random = User.all.ids.shuffle[0]
    current_meetup = Meetup.find_by(random.to_s)
    if current_meetup.user_two == nil && current_meetup.user_one != current_user.id
    current_meetup.user_two = current_user.id
    current_meetup.save
    redirect_to current_user
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
    if current_user == nil
    redirect_to "https://www.google.com/maps/dir/?api=1&origin=#{session[:location]}&destination=#{session[:destination_address]}&travelmode=walking"
    elsif @current_meetup != nil
      redirect_to "https://www.google.com/maps/dir/?api=1&origin=#{session[:location]}&destination=#{@current_meetup.location}&travelmode=walking"
    elsif @current_meetup_joined != nil
      redirect_to "https://www.google.com/maps/dir/?api=1&origin=#{session[:location]}&destination=#{@current_meetup_joined.location}&travelmode=walking"
    else
      redirect_to current_user
    end
    end

  private

  def meetup_params
    params.require(:meetup).permit(:user_one, :meet_date, :meet_time, :location, :guest_user, :location_name)
  end

  def current_meetup
    # @current_meetup = Meetup.find_by(user_one: current_user.id)
    # @current_meetup_joined = Meetup.find_by(user_two: current_user.id)
  end

  def current_meetup_slug
      @meetup = Meetup.find_by(slug: params[:slug])
    end

end
