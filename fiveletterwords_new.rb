@words = []
file = File.open("wordlist copy.txt")
file.each do |line|
  @words.push line.chomp
end
@five_letter_words = []
@words.each do |word|
  if word.length == 5
    @five_letter_words << word
  end
end

def find_words
#round one


  shuffled_words = @five_letter_words.shuffle
  @word_one = @five_letter_words.sample.split("")
  @word_two = "aaaaa".split("")
  @word_three = "aaaaa".split("")
  @word_four = "aaaaa".split("")
  @word_five = "aaaaa".split("")



  shuffled_words.each do |word|
    if word[0] == @word_one[0]
      @word_two[0] = word[1]
      @word_three[0] = word[2]
      @word_four[0] = word[3]
      @word_five[0] = word[4]
      break
    end
  end

#round two
  shuffled_words.each do |word|
    if word[0] == @word_two[0]
      @word_two[1] = word[1]
      @word_two[2] = word[2]
      @word_two[3] = word[3]
      @word_two[4] = word[4]
      break
    end
  end

  shuffled_words.each do |word|
    if word[0] == @word_one[1] && word[1] == @word_two[1]
      @word_three[1] = word[2]
      @word_four[1] = word[3]
      @word_five[1] = word[4]
      break
    end
  end

  #check down
    unless shuffled_words.any? {|word| word.start_with?("#{@word_one[2]}#{@word_two[2]}")}
      return ""
    end
    unless shuffled_words.any? {|word| word.start_with?("#{@word_one[3]}#{@word_two[3]}")}
      return ""
    end
    unless shuffled_words.any? {|word| word.start_with?("#{@word_one[4]}#{@word_two[4]}")}
      return ""
    end

#check across
  unless shuffled_words.any? {|word| word.start_with?("#{@word_three[0]}#{@word_three[1]}")}
    return ""
  end
  unless shuffled_words.any? {|word| word.start_with?("#{@word_four[0]}#{@word_four[1]}")}
    return ""
  end
  unless shuffled_words.any? {|word| word.start_with?("#{@word_five[0]}#{@word_five[1]}")}
    return ""
  end

#round three
  shuffled_words.each do |word|
    if word[0] == @word_three[0] && word[1] == @word_three[1]
      @word_three[2] = word[2]
      @word_three[3] = word[3]
      @word_three[4] = word[4]
      break
    end
  end


  shuffled_words.each do |word|
    if word[0] == @word_one[2] && word[1] == @word_two[2] && word[2] == @word_three[2]
      @word_four[2] = word[3]
      @word_five[2] = word[4]
      break
    end
  end

  #check down
    unless shuffled_words.any? {|word| word.start_with?("#{@word_one[3]}#{@word_two[3]}#{@word_three[3]}")}
      return ""
    end
    unless shuffled_words.any? {|word| word.start_with?("#{@word_one[4]}#{@word_two[4]}#{@word_three[4]}")}
      return ""
    end

#check across
  unless shuffled_words.any? {|word| word.start_with?("#{@word_four[0]}#{@word_four[1]}#{@word_four[2]}")}
    return ""
  end
  unless shuffled_words.any? {|word| word.start_with?("#{@word_five[0]}#{@word_five[1]}#{@word_five[2]}")}
    return ""
  end

#found four

shuffled_words.each do |word|
  word = word.split("")
  if word[0] == @word_four[0] && word[1] == @word_four[1] && word[2] == @word_four[2]
    @word_four[3] = word[3]
    @word_four[4] = word[4]
    break
  end
end

shuffled_words.each do |word|
  word = word.split("")
  if word[0] == @word_one[3] && word[1] == @word_two[3] && word[2] == @word_three[3] && word[2] == @word_four[3]
    @word_five[3] = word[4]
    break
  end
end

#check
  unless shuffled_words.any? {|word| word.start_with?("#{@word_five[0]}#{@word_five[1]}#{@word_five[2]}#{@word_five[3]}")}
    return ""
  end
  unless shuffled_words.any? {|word| word.start_with?("#{@word_one[4]}#{@word_two[4]}#{@word_three[4]}#{@word_four[4]}")}
    return ""
  end

#first one
  shuffled_words.each do |word|
    if word[0] == @word_five[0] && word[1] == @word_five[1] && word[2] == @word_five[2] && word[3] == @word_five[3] &&
      shuffled_words.include?("#{@word_one[4]}#{@word_two[4]}#{@word_three[4]}#{@word_four[4]}#{word[4]}")
        @word_five[4] = word[4]
        break
    else
      return ""
    end
  end

  @board = [@word_one, @word_two, @word_three, @word_four, @word_five]
  @board_reverse = @board.transpose

  puts @word_one.join("")
  puts @word_two.join("")
  puts @word_three.join("")
  puts @word_four.join("")
  puts @word_five.join("")
  puts ""
  puts @board_reverse[0].join("")
  puts @board_reverse[1].join("")
  puts @board_reverse[2].join("")
  puts @board_reverse[3].join("")
  puts @board_reverse[4].join("")
  puts ""
end
@x = 0
until find_words != ""
  puts "#{@x}"
  @x += 1
  find_words
end
