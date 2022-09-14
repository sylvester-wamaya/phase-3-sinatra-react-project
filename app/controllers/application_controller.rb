class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get "/voters" do
    Voter.all.to_json(include: [:station])
  end

  get "/voters/:id" do
    find_voter
    voter_to_json
  end

  post "/stations/:station_id/voters" do
    find_station
    @voter = @station.voters.create(params)
    if @voter.save
      # return object as json if saved
      voter_to_json
    else
      # return error message if not saved
      voter_errors_messages
    end
  end
  delete "/voters/:id" do
    find_voter
    if @voter
      @voter.destroy
      @voter.to_json
    else
      { errors: ["Voter Doesn't Exist"] }.to_json
    end
  end

  private

  def find_voter
    @voter = Voter.find_by_id(params["id"])
  end

  def find_station
    @station = Station.find_by_id(params["station_id"])
  end

  def voter_to_json
    @voter.to_json(include: [:show])
  end

  def voter_errors_messages
    { errors: @voter.errors.full_messages }.to_json
  end
  get "/stations" do
    # render all shows as json
    # binding.pry
    Station.all.to_json(include: [:voters])
  end

  get "/stations/:id" do
    find_stations
    stations_to_json
  end

  post "/stations" do
    # binding.pry
    @station = Station.new(params)
    if @station.save
      # return object as json if saved
      stations_to_json
    else
      # return error message if not saved
      stations_errors_messages
    end
  end

  # Stretch goal for added feature
  # patch "/shows/:id" do
  #   find_shows
  #   if show.update(params)
  #     shows_to_json
  #   else
  #    shows_errors_messages
  #   end
  # end

  delete "/stations/:id" do
    find_stations
    if @station
      @station.destroy
      @station.to_json
    else
      { errors: ["Station Doesn't Exist"] }.to_json
    end
  end

  private
  def find_stations
    @station = Station.find_by_id(params["id"])
  end

  def stations_to_json
    @station.to_json(include: [:voters])
  end

  def stations_errors_messages
    { errors: @station.errors.full_messages }.to_json
  end
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

end
