#!/usr/bin/env ruby

require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, {
 :adapter => 'mysql',
 :host => 'localhost',
 :username => 'jy1415' ,
 :password => 'pkiozadv',
 :database => 'jy1415'})

#keypress model for database interaction

class Digit
  include DataMapper::Resource

  property :id, Serial # An auto-increment integer key
  property :caller_id, String, :required => true 
  property :digit, String, :required => true
  property :created_at, DateTime # A DateTime, for any date you might like.
end

# Main route - this is the form where we take the input
get '/' do
  @digits = Digit.all(:order => [ :id.desc], :limit => 20)
  erb :index
end

#html template
__END__

@@index
<html>
  <head>
    <title>MissedCall Board</title>
    <style>
      .1 {
        width:  100px;
        height: 100px;
        background: #000;
      }
      .2 {
        width:  100px;
        height: 100px;
        background:  #0f0;
      }
      .3 {
        width:  100px;
        height: 100px;
        background:  #00f;
      }
      .4 {
        width:  100px;
        height: 100px;
        background:  #ff0;
      }
      .5 {
        width:  100px;
        height: 100px;
        background:  #f0f;
      }
      .6 {
        width:  100px;
        height: 100px;
        background:  #0ff;
      }
    </style>
  </head>
<body>
<%= yield %>
</body>
</html>

@@index
<% @digits.each do |digit| %>
  <div class=<%= digit.id %>>
    <p><%= digit.caller_id %></p>
    <p><%= digit.digit %></p>
    <p><%= digit.created_at %></p>
  </div>
<% end %>