require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'

class CrackTest < Minitest::Test

  def test_the_class_exists
    assert Crack.new
  end

  def test_it_reads_a_file
    c = Crack.new
    result = "LymZzwqsxLKK%m;vrK;>"
    ARGV[0] = "encrypted_test.txt"
    assert result, c.open_file
  end

  def test_it_writes_a_file
    c = Crack.new
    message = c.open_file
    assert c.write_file(message)
  end

end
