require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    @volunteers = Volunteer.all
    @political_interests = PoliticalInterest.all
    
    erb :welcome
  end

  post "/" do
    @volunteer = Volunteer.create(params[:volunteer])
    if !params["political_interest"]["name"].empty?
      @volunteer.political_interests << PoliticalInterest.create(name: params["political_interest"]["name"])
    end
    @volunteer.save

    redirect "/"
  end

  get "/registers" do
    @volunteers = Volunteer.all
    @voters = Voter.all

    erb :registers
  end

  get "/volunteers" do
    @volunteers = Volunteer.all

    erb :volunteers
  end

  get "/voters" do
    @voters = Voter.all

    erb :voters
  end
end
