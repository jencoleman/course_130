require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  
  def setup
    @car = Car.new
  end

  def test_car_exists
    assert(@car)
  end

end
