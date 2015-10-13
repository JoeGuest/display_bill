require 'sinatra'
require './app/models/api/bill'
require './app/decorators/bill_decorator'
require './app/decorators/bill_decorator/call_charges_decorator'
require './app/decorators/bill_decorator/package_decorator'
require './app/decorators/bill_decorator/sky_store_decorator'
require './app/decorators/bill_decorator/statement_decorator'

set :views, Proc.new { File.join(root, "app/views") }

I18n.enforce_available_locales = false

get '/' do
  erb :index, locals: { bill: decorated_bill }
end

def decorated_bill
  BillDecorator.decorate(bill)
end

def bill
  API::Bill.get
end
