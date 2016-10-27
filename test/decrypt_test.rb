require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'

class DecryptTest < Minitest::Test

  def test_the_freaking_class_exists
    assert Decrypt.new
  end

  def test_it_reads_a_file
    d = Decrypt.new
    result = "This is a test"
    ARGV[0] = "encrypted_test.txt"
    assert result, d.open_file
  end

  def test_it_returns_an_decrypted_message
    d = Decrypt.new
    result = "This is a test "
    message = "This is a test"
    refute result == d.decrypt_the_message(message)
  end

  def test_it_writes_a_file
    d = Decrypt.new
    message = d.open_file
    assert d.write_file(message)
  end

end
