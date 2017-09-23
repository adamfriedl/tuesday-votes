ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(
#   adapter: "postgresql",
#   database: "db/#{ENV['SINATRA_ENV']}"
# )

# require_all 'app'

configure :development do
  ENV['SINATRA_ENV'] ||= "development"

  # set :database, ENV['SINATRA_ENV']
  # set :show_exceptions, true

  ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    database: "db/#{ENV['SINATRA_ENV']}"
  )

 end

 ENV['SINATRA_ENV'] ||= "production"
 
 configure :production do
  # ENV['SINATRA_ENV'] ||= "production"

  set :database, ENV['SINATRA_ENV']
  set :show_exceptions, true

  ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    database: "db/#{ENV['SINATRA_ENV']}"
  )

 end

 require_all 'app'