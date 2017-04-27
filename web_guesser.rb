require 'sinatra'
require 'sinatra/reloader'

class WebGuesser
  attr_reader :secret_number
  attr_accessor :background
    def initialize
      @secret_number = rand(100)
      @background = "FD1616"
    end

    def guess_checker(guess)
      if guess > (secret_number + 4)
        @background = "#FD1616"
        message = "WAY to high"
      elsif guess < (secret_number - 4)
        @background = "#FD1616"
        message = "WAY too low"
      elsif guess > secret_number
        @background = "#F37171"
        message = "Too High!"
      elsif guess < secret_number
        @background = "#F37171"
        message = "Too Low"
      elsif guess == secret_number
        @background = "#35D83B"
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
    :message => message,
    :background_color => guesser.background
  }
end
