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

  # private 

  # def volunteer_params
  #   params.require(volunteer).permit(:first_name, :middle_initial, :last_name, :date_of_birth, :social_issues, :economy, :health_care, :environment, :other)
  # end

end
