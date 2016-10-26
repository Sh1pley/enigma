require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def test_the_freaking_class_exists
    assert Encrypt.new
  end

  def test_it_reads_a_file
    e = Encrypt.new
    result = "This is a test"
    ARGV[0] = "test_message.txt"
    assert result, e.open_file
  end

  def test_it_returns_an_encrypted_message
    e = Encrypt.new
    result = "This is a test"
    message = "This is a test"
    refute result == e.encrypt_the_message(message)
  end

  def test_it_writes_a_file
    e = Encrypt.new
    message = e.open_file
    assert e.write_file(message)
  end

end
