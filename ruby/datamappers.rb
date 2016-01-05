#!/usr/bin/ruby
require 'data_mapper'

DataMapper.setup(:default, {
 :adapter => 'mysql',
 :host => 'localhost',
 :username => 'jy1415' ,
 :password => 'pkiozadv',
 :database => 'jy1415'})

call_id=ARGV[0]
class Phone
  include DataMapper::Resource

  property :id, Serial # An auto-increment integer key
  property :caller_id, String, :required => true 
  property :created_at, DateTime # A DateTime, for any date you might like.
end

# Automatically create the tables if they don't exist
DataMapper.auto_upgrade!
# Finish setup
DataMapper.finalize

new_call=Phone.create(:caller_id => call_id, :created_at => Time.now)
new_call.save()