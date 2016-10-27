require_relative 'file_worker'
require_relative 'decryption'



class Decrypt
  attr_reader :file_worker,
              :decryption

  def initialize
    @file_worker = FileWorker.new
  end

  def open_file
    message = file_worker.file_reader(ARGV[0])
    decrypt_the_message(message)
  end

  def decrypt_the_message(message)
    @decryption = Decryption.new(ARGV[2], ARGV[3])
    decrypted = decryption.prepare_the_message_for_decryption(message)
    write_file(decrypted)
  end

  def write_file(decrypted)
    file_worker.file_writer(decrypted)
    # puts "You created #{ARGV[1]} with a key of #{encryption.key.join} and a date of #{Time.now.strftime("%d%m%y")}  "
  end

end

d = Decrypt.new
d.open_file
