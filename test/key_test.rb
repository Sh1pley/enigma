require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_exists
    assert Key.new
  end

  def test_encryption_key_starts_as_empty_array
    k = Key.new
    assert_equal Array, k.encryption_key.class
    assert k.encryption_key.empty?
  end

  def test_encryption_key_is_5_digits
    k = Key.new
    k.generate_number
    assert_equal 5, k.encryption_key[0].count
  end

  def test_encryption_key_is_truly_random
    k1 = Key.new.generate_number
    k2 = Key.new.generate_number
    refute k1 == k2
  end
end