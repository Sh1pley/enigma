require 'pry'
class FileWorker

  def file_reader(filename)
    # binding.pry
    File.read(filename).chomp
  end

  def file_writer(text ,filename)
    File.open(filename, 'w').write(text)
  end
end
