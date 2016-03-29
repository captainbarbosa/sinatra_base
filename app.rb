require 'rubygems'
require 'bundler/setup'
require 'sinatra' # Will start web server
require 'active_record'
require 'pry'
# Initial seed of DB
require './development'

#Set up production DB
# require './production_db'

before do
  content_type 'application/json'
end


# Homepage
get '/' do
  "/employees => List of employees"
end

# List all employees at http://localhost:4567/employees
get '/employees' do
  Employee.all.to_json
end

# List an individual employee at http://localhost:4567/employees/:id
get '/employees/:id' do
  employee = Employee.find(params["id"])

  employee.to_json
end

post '/employees' do
  payload = JSON.parse(request.body.read)
  employee = Employee.create(payload).to_json
end
