require 'sinatra'
require 'sinatra/reloader'

class WebGuesser
  attr_reader :secret_number
    def initialize
      @secret_number = rand(100)
    end

    def guess_checker(guess)
      if guess > secret_number
        message = "Too High!"
      elsif guess < secret_number
        message = "Too Low"
      elsif guess == secret_number
        message = "That's Just Right, you WIN!"
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
    :guess => 'guess',
    :message => message
  }
end
