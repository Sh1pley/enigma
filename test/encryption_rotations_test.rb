require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption_rotations'

class EncryptionRotationTest < Minitest::Test

  def test_it_exists
    assert EncryptionRotations.new
  end

  def test_it_has_access_to_offset
    er = EncryptionRotations.new
    assert er.offset
  end

  def test_it_has_access_to_key
    er = EncryptionRotations.new
    assert er.key
  end

  def test_key_has_actual_value
    er = EncryptionRotations.new
    refute er.key.nil?
  end

  def test_offset_has_actual_value
    er = EncryptionRotations.new
    refute er.offset.nil?
  end

  def test_rotations_is_an_array
    er = EncryptionRotations.new
    er.generate_rotations
    assert_equal Array, er.rotations.class
  end

  def test_rotations_has_4_rotations
    er = EncryptionRotations.new
    assert 4, er.generate_rotations.length
  end

  

end