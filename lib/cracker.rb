require_relative 'decryption'

class Cracker

  def initialize(date)
    @date = date
  end

  def crack(message)
    99999.times do |i|
      d = Decryption.new(i.to_s.rjust(5,"0"), @date)
      cracked = d.prepare_the_message_for_decryption(message)
      return cracked if cracked[-7..-1] == "..end.."
    end
  end
end
