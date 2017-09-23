require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  post "/volunteer" do
    @volunteer = Volunteer.new(params[:volunteer])
    @volunteer.save
    
    erb :welcome
  end

  private 

  def volunteer_params
    params.require(volunteer).permit(:first_name, :middle_initial, :last_name, :date_of_birth, :social_issues, :economy, :health_care, :environment, :other)
  end

end
