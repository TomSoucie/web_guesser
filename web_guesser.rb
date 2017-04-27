require 'sinatra'
require 'sinatra/reloader'

class WebGuesser
  attr_reader :secret_number
    def initialize
      @secret_number = rand(100)
    end

    def guess_checker(guess)
      if guess > (secret_number + 4)
        message = "WAY to high"
      elsif guess < (secret_number - 4)
        message = "WAY too low"
      elsif guess > secret_number
        message = "Too High!"
      elsif guess < secret_number
        message = "Too Low"
      elsif guess == secret_number
        message = "You got it right, the secret number is #{secret_number}!"
      end
    end

end

guesser = WebGuesser.new

get '/' do
  guess_number = params['guess'].to_i
  number = guesser.secret_number
  message = guesser.guess_checker(guess_number)

  erb :index, :locals => {
    :number => number,
    :message => message
  }
end
