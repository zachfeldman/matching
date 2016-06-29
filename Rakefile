require 'sinatra/activerecord/rake'
require './app'


require 'rake'
require 'gmail'
require 'pry'


def extract_info email
  message = email.message.body.raw_source
  charity_status = message.match /Doctors Without Borders/
  return if !charity_status
  id = message.split("\n").last.split("--")[1]
  amount = message.match(/\$[0-9]*.[0-9][0-9]/)
  timestamp = message.match(/Date: (.*)\n/)[0]
  email = message.match(/To:(.*)/)[0].gsub("To: ", "").gsub("\r", "")
  {gmail_id: id, donation_amount_in_cents: amount[0].gsub("$", "").gsub(".","").to_i, donation_timestamp: timestamp, email: email} if charity_status
end

task :check_match do

    gmail = Gmail.new(ENV['FWD_EMAIL'], ENV['FWD_PASS'])
    emails = gmail.inbox.emails
    emails.each do |email|
      Donation.create(extract_info(email))
    end
end