require 'minitest/autorun'
require 'minitest/pride'
require './lib/cracker'

class CrackerTest < Minitest::Test

  def test_the_class_exists
    date = (271016)
    assert Cracker.new(date)
  end

  def test_cracker_returns_the_key_as_a_fixnum
    date = (271016)
    c = Cracker.new(date)
    message= ("4tgW]tgWltgWEtgW*tgW*tg")
    assert Fixnum, c.crack(message).class
  end





end
