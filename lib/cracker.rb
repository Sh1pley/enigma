require_relative 'decryption'
require 'pry'

class Cracker

  attr_reader :key

  def initialize(date)
    @date = date
    # @key = [] 
  end

  def crack(message)
    99999.times do |i|
      d = Decryption.new(i.to_s.rjust(5,"0"), @date)
      cracked = d.prepare_the_message_for_decryption(message)
      @key = i if cracked[-7..-1] == "..end.."
      return @key && cracked  if cracked[-7..-1] == "..end.."
    end
  end
end
