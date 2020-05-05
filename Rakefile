require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "Start our app console"
task :console do
  ActiveRecord::Base.logger = nil
  # ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end
