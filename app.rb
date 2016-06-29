require 'sinatra'
require 'sinatra/activerecord'

require 'money'

configure(:development){ 
  set :database, "sqlite3:matching.sqlite3"
}

class Donation < ActiveRecord::Base

  validates_uniqueness_of :gmail_id
  validates_presence_of :donation_amount_in_cents
  validates_uniqueness_of :email, :scope => :donation_timestamp

end

get "/" do
  erb :index
end