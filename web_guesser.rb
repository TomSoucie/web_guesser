require 'sinatra'

class WebGuesser
  attr_reader :secret_number
    def initialize
      @secret_number = rand(100)
    end

end

number = WebGuesser.new.secret_number
get '/' do
  "The secret number is #{number}"
end
