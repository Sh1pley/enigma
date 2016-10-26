require 'pry'

class FileWorker

  def file_reader(filename)
    File.read(ARGV[0])
  end

  def file_writer(text)
    File.open(ARGV[1], 'w').write(text)
  end
end
