require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption'

class EncryptionTest < Minitest::Test

  def test_the_class_exists
    message = "This is the message"
    assert Encryption.new(message)
  end

  def test_rotations_is_an_array
    message = "This is the message"
    e = Encryption.new(message)

    assert Array, e.rotations
  end

  def test_it_splits_the_message
    message = "This is the message"
    e = Encryption.new(message)

    assert String, e.splits_the_message.class
  end

  def test_it_prepares_for_encryption_by_pulling_out_of_split_til_it_is_empty
    message = "This is the message"
    e = Encryption.new(message)

    split = ["T", "h", "i", "s", " ", "i", "s", " ", "t", "h", "e", " ", "m", "e", "s", "s", "a", "g", "e"]

    assert_equal NilClass, e.prepares_for_encryption(split).class
  end

  




end
