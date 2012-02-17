require 'sinatra'
require 'json'
require 'rubygems'
require 'mongo'
require 'mongoid'
require 'bson'

require './configure_mongo'
require './models'

# set sinatra's variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :public_folder, 'public'


get '/upload' do
  jsonData = File.read(File.join('public', 'pending-policy-summary.json'))
  policies = JSON.parse(jsonData)

  #puts policy[0]["name"]

  #newEpic = Policy.create(enrollments[0])

  Policy.collection.insert(policies)

  content_type :json
  {:success => 'true'}.to_json

end

get '/policies' do
  policies = Policy.all

  policies.to_json
end

