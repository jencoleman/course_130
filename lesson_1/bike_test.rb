require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'bike'

class BikeTest < Minitest::Test
  def setup
    @bike = Bike.new
  end
  def test_wheels
    assert_equal(2, @bike.wheels)
  end
  def test_bad_wheels
    refute_equal(3, @bike.wheels)
  end
  
  def test_bike_exists
    assert(@bike)
  end
  
  def test_name_is_nil
    assert_nil(@bike.name)
  end
end