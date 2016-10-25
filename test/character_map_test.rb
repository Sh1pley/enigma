require 'minitest/autorun'
require 'minitest/pride'
require './lib/character_map'

class CharacterMapTest < Minitest::Test

  def test_the_class_exists
  assert CharacterMap.new
  end

  def test_the_character_map_is_not_empty
    c = CharacterMap.new

    refute c.character_map.empty?
  end

end
