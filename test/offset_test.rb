require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_the_class_exists
    assert Offset.new
  end

  def test_that_the_date_is_returned_as_a_six_digit_number
    o = Offset.new

  assert_equal 6, Time.now.strftime("%d%m%y").length
  end

  def test_that_the_date_is_squared
  skip
    o = Offset.new

  assert_equal (Time.now.strftime("%d%m%y")).to_i * (Time.now.strftime("%d%m%y")).to_i , o.square_the_date
  end

  def test_the_offset_is_four_numbers_long
    o = Offset.new

    assert_equal 4, o.generate_offset((Time.now.strftime("%d%m%y")).to_i ** 2).count 
  end

  def test_the_offest_isnt_random
    o_1 = Offset.new.generate_offset((Time.now.strftime("%d%m%y")).to_i ** 2)
    o_2 = Offset.new.generate_offset((Time.now.strftime("%d%m%y")).to_i ** 2)

    assert o_1 == o_2
  end 
end