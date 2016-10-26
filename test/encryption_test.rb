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

  def test_it






end
