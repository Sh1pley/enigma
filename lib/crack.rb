require_relative 'file_worker'
require_relative 'cracker'



class Crack
  attr_reader :file_worker,
              :encryption,
              :cracker

  def initialize
    @file_worker = FileWorker.new
  end

  def open_file
    message = file_worker.file_reader(ARGV[0])
    crack_the_message(message, ARGV[2])
  end

  def crack_the_message(message, date)
    @cracker = Cracker.new(date)
    cracked = cracker.crack(message)
    write_file(cracked)
  end

  def write_file(cracked)
    file_worker.file_writer(cracked)
    puts "You created #{ARGV[1]} and the key is #{cracker.key} !! "
  end

end

c = Crack.new
c.open_file
