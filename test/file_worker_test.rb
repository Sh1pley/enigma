require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_worker'

class FileWorkerTest < Minitest::Test

  def test_the_test_exists
    f = FileWorker.new

    assert FileWorker.new
  end

  def test_it_reads_a_file
    f = FileWorker.new
    result = "This is a test"
    ARGV[0] = "test_message.txt"
    ARGV[1] = "encrypted.txt"
    assert result, f.file_reader("test_message.txt")
  end

  def test_it_writes_a_file
    f = FileWorker.new
    result = "This is a test"
    ARGV[0] = "test_message.txt"
    ARGV[1] = "encrypted.txt"
    assert result, f.file_writer(result)
  end
end
