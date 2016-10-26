require_relative 'file_worker'
require_relative 'encryption'
require_relative "encryption_rotations"

# binding.pry

class Encrypt
  # binding.pry
  attr_reader :file_worker,
              :encryption

  def initialize
    @file_worker = FileWorker.new
  end

  def open_file
    message = file_worker.file_reader(ARGV[0])
    encrypt_the_message(message)
  end

  def encrypt_the_message(message)
    @encryption = Encryption.new(message)
    encrypted = encryption.splits_the_message
    write_file(encrypted)
  end

  def write_file(encrypted)
    file_worker.file_writer(encrypted)
    puts "You created #{ARGV[1]} with a key of #{encryption.key.join} and a date of #{Time.now.strftime("%d%m%y")}  "
  end

end

e = Encrypt.new
e.open_file
