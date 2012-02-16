require 'sinatra'
require 'json'
require 'rubygems'
require 'mongo'
require 'mongoid'
require 'bson'

require './configure_mongo'

# set sinatra's variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :public_folder, 'public'


get '/upload' do
  jsonData = File.read(File.join('public', 'enrollments.json'))
  #puts jsonData

  enrollments = JSON.parse(jsonData)

  puts enrollments[0]["name"]

  #newEpic = Policy.create(enrollments[0])

  Policy.collection.insert(enrollments)

  content_type :json
  { :key1 => 'value1', :key2 => 'value2' }.to_json

end

get '/policies' do
  policies = Policy.all

  policies.to_json

end




class Policy
  include Mongoid::Document
  field :id
  field :name
end