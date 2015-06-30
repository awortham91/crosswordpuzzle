class Word_lists
  attr_accessor :words, :five_letter_words, :alphabet

  def initialize
    @words = []
    @five_letter_words = []
    @alphabet = ('a'..'z').to_a
    file = File.open("wordlist copy.txt")
    file.each do |line|
      words.push line.chomp
    end
  end

  def five_letters
    words.each do |word|
      if word.length == 5
        five_letter_words << word
      end
    end
  end

  def create_arrays
    number = 0
    26.times do
        alphabet[number] = Array.new
      number += 1
    end
  end

  def five_list
    count = 0
    letter = 'a'
    25.times do
      five_letter_words.each do |five_letter_word|
        if five_letter_word.start_with?(letter)
          alphabet[count] << five_letter_word
        end
      end
      letter = letter.next
      count += 1
    end
  end
end
