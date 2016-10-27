class Offset
  attr_reader :encryption_offset


  def square_the_date
    date_squared = (Time.now.strftime("%d%m%y")).to_i ** 2
    generate_offset(date_squared)
  end

  def generate_offset(date_squared)
    @encryption_offset = []
   (@encryption_offset << date_squared.to_s.chars[-4..-1]).flatten
  end
end
