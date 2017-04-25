gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './web_guesser'

class WebGuesserTest < Minitest::Test
  def test_the_object_is_a_guesser
    guesser = WebGuesser.new

    assert_instance_of WebGuesser, guesser
  end
end
