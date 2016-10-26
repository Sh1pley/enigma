require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryption'

class DecryptionTest < Minitest::Test

  def test_it_exists
    assert Decryption.new(12345, 1234)
  end

  def test_it_can_take_a_key_input
    key = "12345"
    date = "241016"
    d = Decryption.new(key, date)
    
    assert_equal "12345", d.key
  end

  def test_it_can_take_an_date_input
    key = "12345"
    date = "241016"
    d = Decryption.new(key, date)

    assert_equal "241016", d.date
  end

  def test_it_can_calculate_rotations
    key = "12345"
    date = "241016"
    d = Decryption.new(key, date)

    assert_equal [14, 27, 35, 45], d.calculate_rotations
  end



end