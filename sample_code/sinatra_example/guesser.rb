require 'sinatra'
require 'sinatra/reloader'

# The secret number to guess.  This will start as an invalid value
number = -1

# Generate a secret number from 1 to 100
def secret_num
  rand(1..100)
end

# Determine the message to send depending on whether the guess is higher,
# lower, or the same as the secret number
def determine_msg(number, guess)
  to_return = ""
  if guess == number
    to_return = "That's exactly right!"
  elsif guess > number
    to_return = "That's too high!"
  else
    to_return = "That's too low!"
  end
  to_return
end

# ****************************************
# GET REQUESTS START HERE
# ****************************************

# If a request comes in for /bill, show the bill view
get '/bill' do
  puts "This will go in the logging output - bill called"
  erb :bill # parses bill.erb -> displays it
end

# If a request comes in for /nobill, show the no bill view
get '/nobill' do
  puts "This will go in the logging output - nobill called"
  erb :nobill
end


# Show the meow view.
# Display "meow" x times on the page
get '/meow' do
  puts "Params hash is : #{params}"
  # If x is given as a parameter, set it to x; otherwise, set it to five
  x = params['x']

  x ||= 5 # if x is nil, set to 5
  x = x.to_i
  erb :meow, :locals => {x: x, meow: "MEEEEEEEEEEOW"}
end

# What to do if we can't find the route
not_found do
  status 404
  erb :error
end


# If a GET request comes in at /, do the following.

get '/' do
  # Get the parameter named guess and store it in pg
  pg = params['guess']
  # If there was no guess parameter, this is a brand new game.
  # Generate a secret number and set the guess to nil.
  if pg.nil?
    number = secret_num
    puts "Setting secret number to #{number}"
    guess = nil
    got_it = false
  else
    guess = pg.to_i
    msg = determine_msg number, guess
    got_it = guess == number
  end
  erb :index, :locals => { number: number, guess: guess, got_it: got_it, msg: msg }
end
