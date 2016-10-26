require 'minitest/autorun'
require 'minitest/pride'
require './lib/character_map'

class CharacterMapTest < Minitest::Test

  def test_the_class_exists
  assert CharacterMap.new
  end

  def test_the_character_map_is_not_empty
    c = CharacterMap.new

    refute c.characters.empty?
  end

  def test_character_hash_is_a_hash
    c = CharacterMap.new

    assert Hash, c.character_hash.class
  end

  def test_character_hash_has_75_elements
    c = CharacterMap.new

    assert 75, c.character_hash.count
  end

  def test_character_hash_has_values
    c = CharacterMap.new

    assert_equal 7 , c.character_hash.fetch("g")
  end
end
