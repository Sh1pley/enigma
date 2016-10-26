require 'pry'
class FileWorker

  def file_reader(filename)
    File.read(filename).chomp
  end

  def file_writer(text ,filename)
    File.open(filename, 'w').write(text)
  end
end
