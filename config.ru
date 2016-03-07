require 'sinatra'
require 'active_record'
require 'pg'

Dir["./app/controllers/*"].each {|file| require file }
Dir["./app/models/*"].each {|file| require file }

# ActiveRecord::Base.establish_connection(
#   adapter:  'postgresql',
#   database: 'devflix',
#   host:     'localhost'
# )

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/devflix')

use Rack::MethodOverride
use MoviesController
run ApplicationController
