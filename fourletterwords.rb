@words = []
file = File.open("wordlist copy.txt")
file.each do |line|
  @words.push line.chomp
end
@four_letter_words = []
@words.each do |word|
  if word.length == 4
    @four_letter_words << word
  end
end


def find_words
#first (four)
  shuffled_words = @four_letter_words.shuffle
  @word_one = @four_letter_words.sample.split("")
  @word_two = "aaaa".split("")
  @word_three = "aaaa".split("")
  @word_four = "aaaa".split("")

#second (three)
  shuffled_words.each do |word|
    word = word.split("")
    if word[0] == @word_one[0]
      @word_two[0] = word[1]
      @word_three[0] = word[2]
      @word_four[0] = word[3]
      break
    end
  end

#third (three)
  shuffled_words.each do |word|
    word = word.split("")
    if word[0] == @word_two[0]
      @word_two[1] = word[1]
      @word_two[2] = word[2]
      @word_two[3] = word[3]
      break
    end
  end

#check 1
  unless shuffled_words.any? {|word| word.start_with?("#{@word_one[1]}#{@word_two[1]}")}
    find_words
    return ""
  end
  unless shuffled_words.any? {|word| word.start_with?("#{@word_one[2]}#{@word_two[2]}")}
    find_words
    return ""
  end
  unless shuffled_words.any? {|word| word.start_with?("#{@word_one[3]}#{@word_two[3]}")}
    find_words
    return ""
  end

#fourth (two)
  shuffled_words.each do |word|
    word = word.split("")
    if word[0] == @word_one[1] && word[1] == @word_two[1]
      @word_three[1] = word[2]
      @word_four[1] = word[3]
      break
    end
  end

#check 2
  unless shuffled_words.any? {|word| word.start_with?("#{@word_three[0]}#{@word_three[1]}")}
    find_words
    return ""
  end
  unless shuffled_words.any? {|word| word.start_with?("#{@word_four[0]}#{@word_four[1]}")}
    find_words
    return ""
  end

#fifth (two)
  shuffled_words.each do |word|
    word = word.split("")
    if word[0] == @word_three[0] && word[1] == @word_three[1]
      @word_three[2] = word[2]
      @word_three[3] = word[3]
      break
    end
  end

#check 3
  unless shuffled_words.any? {|word| word.start_with?("#{@word_one[2]}#{@word_two[2]}#{@word_three[2]}")}
    find_words
    return ""
  end
  unless shuffled_words.any? {|word| word.start_with?("#{@word_one[3]}#{@word_two[3]}#{@word_three[3]}")}
    find_words
    return ""
  end

#sixth (one)
  shuffled_words.each do |word|
    word = word.split("")
    if word[0] == @word_one[2] && word[1] == @word_two[2] && word[2] == @word_three[2]
      @word_four[2] = word[3]
      break
    end
  end

#check 4
  unless shuffled_words.any? {|word| word.start_with?("#{@word_four[0]}#{@word_four[1]}#{@word_four[2]}")}
    find_words
    return ""
  end

#seventh (one)
  shuffled_words.each do |word|
    word = word.split("")
    if word[0] == @word_four[0] && word[1] == @word_four[1] && word[2] == @word_four[2]
      if shuffled_words.include?("#{@word_one[3]}#{@word_two[3]}#{@word_three[3]}#{word[3]}")
        @word_four[3] = word[3]
        break
      end
    end
  end

#check 5 (Yay!)
  unless shuffled_words.any? {|word| word.start_with?("#{@word_four[0]}#{@word_four[1]}#{@word_four[2]}#{@word_four[3]}")}
    find_words
    return ""
  end
  unless shuffled_words.any? {|word| word.start_with?("#{@word_one[3]}#{@word_two[3]}#{@word_three[3]}#{@word_four[3]}")}
    find_words
    return ""
  end

  @board = [@word_one, @word_two, @word_three, @word_four]
  @board_reverse = @board.transpose

  puts @word_one.join("")
  puts @word_two.join("")
  puts @word_three.join("")
  puts @word_four.join("")
  puts ""
  puts @board_reverse[0].join("")
  puts @board_reverse[1].join("")
  puts @board_reverse[2].join("")
  puts @board_reverse[3].join("")
  puts ""
end

find_words
