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

    assert Array, e.splits_the_message.class
  end

  def test_prepares_for_encryption_sends_down_through_to_encryption
    message = "This is the message"
    e = Encryption.new(message)

    refute message  == e.prepares_for_encryption(message.chars)

  end

  def test_it_ecrypts_the_letter
    message = "This is the message"
    e = Encryption.new(message)
    encrypted = []
    index_1 = "T"
    index_2 = "H"
    index_3 = "I"
    index_4 = "S"
    refute index_1 == e.encrypt_index_one(index_1, encrypted)
    refute index_2 == e.encrypt_index_two(index_2, encrypted)
    refute index_3 == e.encrypt_index_three(index_3, encrypted)
    refute index_4 == e.encrypt_index_four(index_4, encrypted)
  end

end
