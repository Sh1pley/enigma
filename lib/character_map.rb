require 'pry'
class CharacterMap

  def characters
    @characters = ["a", "b", "c", "d", "e", "f", "g",
                   "h", "i", "k", "k", "l", "m", "n",
                   "o", "p", "q", "r", "s", "t", "v",
                   "w", "x", "y", "z", "A", "B", "C",
                   "D", "E", "F", "G", "H", "I", "J",
                   "K", "L", "M", "N", "O", "P", "Q",
                   "R", "S", "T", "U", "V", "W", "X",
                   "Y", "Z", "0", "1", "2", "3", "4",
                   "5", "6", "7", "8", "9", ".", ",",
                   "!", "?", " ", "@", "#", "$", "%",
                   "^", "&", "*", "(", ")", "[", "]",
                   "<", ">", ";", ":", "/"]
  end

  def character_hash
    Hash[characters.zip(1..82)]
  end
end
