require 'pry'

class FileWorker

attr_reader :read_file,
            :write_file
  
  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
  end

  def file_reader(read_file)
    File.read(ARGV[0])
  end

  def file_writer(write_file)
    File.open(ARGV[1], 'w').write(write_file)
  end
end
