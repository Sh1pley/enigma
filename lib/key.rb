class Key

  attr_reader :encryption_key

  def initialize
    @encryption_key = []
  end

  def generate_number
    (@encryption_key << 5.times.map{num = rand(0..9)}).flatten
  end

end