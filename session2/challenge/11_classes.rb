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
  attr_reader "num_of_bottles"

  def initialize(num_of_bottles)
    @num_of_bottles = num_of_bottles
    @num_of_bottles = 0 if num_of_bottles < 0
    @num_of_bottles = 99 if num_of_bottles > 99
  end

  def print_song
    bottles_count = @num_of_bottles
    bottle_bottles = bottles_count == 1 ? "bottle" : "bottles"
    while bottles_count > 0
      puts "#{(numbers_to_words(bottles_count)).capitalize} #{bottle_bottles} of beer on the wall,"
      puts "#{(numbers_to_words(bottles_count)).capitalize} #{bottle_bottles} of beer,"
      puts "Take one down, pass it around,"
      bottles_count -= 1
      bottle_bottles = bottles_count == 1 ? "bottle" : "bottles"
      puts "#{(numbers_to_words(bottles_count)).capitalize} #{bottle_bottles} of beer on the wall."
    end
  end

  def numbers_to_words(num)
    return single_digit_to_word(num) if is_a_single_digit?(num)
    return teens_to_words(num) if is_between_10_and_20?(num)
    return tens_to_words(num) if is_a_multiple_of_10?(num)
    two_digit_to_word(num)
  end



  def single_digit_to_word(num)
    case num
    when 0
      return 'zero'
    when 1
      return 'one'
    when 2
      return 'two'
    when 3
      return 'three'
    when 4
      return 'four'
    when 5
      return 'five'
    when 6
      return 'six'
    when 7
      return 'seven'
    when 8
      return 'eight'
    when 9
      return 'nine'
    end
  end


  def teens_to_words(num)
    case num
    when 11
      return 'eleven'
    when 12
      return 'twelve'
    when 13
      return 'thirteen'
    when 15
      return 'fifteen'
    when 18
      return 'eighteen'
    when 14, 16, 17, 19
      return "#{single_digit_to_word(get_ones(num))}teen"
    end
  end

  def tens_to_words(num)
    case num
    when 10
      return 'ten'
    when 20
      return 'twenty'
    when 30
      return 'thirty'
    when 40
      return 'forty'
    when 50
      return 'fifty'
    when 80
      return 'eighty'
    when 60, 70, 90
      return "#{single_digit_to_word(get_tens(num))}ty"
    end
  end

  def two_digit_to_word(num)
    return "#{tens_to_words(get_tens(num)*10)}-#{single_digit_to_word(get_ones(num))}"
  end

  def get_ones(num)
    @ones = num%10
  end

  def get_tens(num)
    @tens = num/10
  end

  def is_a_single_digit?(num)
    num < 10
  end

  def is_between_10_and_20?(num)
    num > 10 && num < 20
  end

  def is_a_multiple_of_10?(num)
    return true if get_ones(num) == 0
    false
  end
end



song  = BeerSong.new(31)
# puts song.num_of_bottles
# puts song.numbers_to_words(song.num_of_bottles)
song.print_song

# song2  = BeerSong.new(90)
# puts song2.num_of_bottles
# puts song2.numbers_to_words(song2.num_of_bottles)
#
# song3  = BeerSong.new(30)
# puts song3.num_of_bottles
# puts song3.numbers_to_words(song3.num_of_bottles)
