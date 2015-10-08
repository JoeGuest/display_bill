require 'sinatra'
require './app/models/api/bill'

set :views, Proc.new { File.join(root, "app/views") }

get '/' do
  erb :index, locals: { bill: API::Bill.get }
end
