require 'minitest/autorun'
require 'minitest/pride'
require './lib/character_map'

class CharacterMapTest < Minitest::Test

  def test_the_class_exists
  assert CharacterMap.new
  end
  
end