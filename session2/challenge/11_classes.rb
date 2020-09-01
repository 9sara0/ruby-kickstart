# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.

class BeerSong
  attr_reader "bottles"

  def initialize(bottles)
    @bottles = bottles
    @bottles = 0 if bottles < 0
    @bottles = 99 if bottles > 99
  end

  def print_song
    @bottles.downto 1 do |i|
      print print_line i
    end
  end

  def print_line(i)
    bottle_bottles = i == 1 ? "bottle" : "bottles"
      puts "#{(numbers_to_words(i))} #{bottle_bottles} of beer on the wall,"
      puts "#{(numbers_to_words(i))} #{bottle_bottles} of beer,"
      puts "Take one down, pass it around,"
      i -= 1
      bottle_bottles = i == 1 ? "bottle" : "bottles"
      puts "#{(numbers_to_words(i))} #{bottle_bottles} of beer on the wall."
  end

  def numbers_to_words(num)
    if num >= 0 && num <= 19
      %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)[num]
    elsif is_a_multiple_of_10?(num)
      %w(zero ten twenty thirty forty fifty sixty seventy eighty ninety)[num/10]
    else
      "#{numbers_to_words(get_tens(num)*10)}-#{numbers_to_words(get_ones(num))}".downcase
    end.capitalize
  end

  def get_ones(num)
    @ones = num%10
  end

  def get_tens(num)
    @tens = num/10
  end

  def is_a_multiple_of_10?(num)
    return true if get_ones(num) == 0
    false
  end
end
