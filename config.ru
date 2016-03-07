require 'sinatra'
require 'active_record'
require 'pg'

Dir["./app/controllers/*"].each {|file| require file }
Dir["./app/models/*"].each {|file| require file }

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  database: 'devflix',
  host:     'localhost'
)

use Rack::MethodOverride
use MoviesController
run ApplicationController
