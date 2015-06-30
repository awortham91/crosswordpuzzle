@one = [" "," "," "," "," "," "," "," "," "]
@two = [" "," "," "," "," "," "," "," "," "]
@three = [" "," "," "," "," "," "," "," "," "]
@four = [" "," "," "," "," "," "," "," "," "]
@five = [" "," "," "," "," "," "," "," "," "]
@six = [" "," "," "," "," "," "," "," "," "]
@seven = [" "," "," "," "," "," "," "," "," "]
@eight = [" "," "," "," "," "," "," "," "," "]
@nine = [" "," "," "," "," "," "," "," "," "]
@ten = [" "," "," "," "," "," "," "," "," "]

require 'pry'
  @x = Time.new

@words = []
file = File.open("wordlist copy.txt")
file.each do |line|
  @words.push line.chomp
end
@five_letter_words = []
@four_letter_words = []
@three_letter_words = []

@words.each do |word|
  if word.length == 5
    @five_letter_words << word
  elsif word.length == 4
    @four_letter_words << word
  elsif word.length == 3
    @three_letter_words << word
  end
end

@shuffled_five = @five_letter_words.shuffle
@shuffled_four = @four_letter_words.shuffle
@shuffled_three = @three_letter_words.shuffle

def middle_square

  #word 1 across

  @word_one = @five_letter_words.sample.split("")
  @word_two = " aaa ".split("")
  @word_three = " aaa ".split("")
  @word_four = "aaaaa".split("")


  #word 4[0]

  @word_four[0] = @shuffled_four.sample.split("")[0]

  #word 1 down

  @shuffled_four.each do |word|
    word = word.split("")
    if word[0] == @word_one[1]
      @word_two[1] = word[1]
      @word_three[1] = word[2]
      @word_four[1] = word[3]
      break
    end
  end

  #check

  unless @shuffled_five.any? {|word| word.start_with?("#{@word_four[0]}#{@word_four[1]}")}
    middle_square
    return ""
  end

  #word 2 across

  @shuffled_three.each do |word|
    word = word.split("")

    if word[0] == @word_two[1]
      @word_two[2] = word[1]
      @word_two[3] = word[2]
    end
  end

  #check

  unless @shuffled_four.any? {|word| word.start_with?("#{@word_one[2]}#{@word_two[2]}")}
    middle_square
    return ""
  end

  unless @shuffled_four.any? {|word| word.start_with?("#{@word_one[3]}#{@word_two[3]}")}
    middle_square
    return ""
  end

  #word 2 down

  @shuffled_four.each do |word|
    word = word.split("")
    if word[0] == @word_one[2] && word[1] == @word_two[2]
      @word_three[2] = word[2]
      @word_four[2] = word[3]
    end
  end

  #check

  unless @shuffled_three.any? {|word| word.start_with?("#{@word_three[1]}#{@word_three[2]}")}
    middle_square
    return ""
  end

  unless @shuffled_five.any? {|word| word.start_with?("#{@word_four[0]}#{@word_four[1]}#{@word_four[2]}")}
    middle_square
    return ""
  end

  #word 3 across

  @shuffled_three.each do |word|
    word = word.split("")

    if word[0] == @word_three[1] && word[1] == @word_three[2]
      @word_three[3] = word[2]
    end
  end

  unless @shuffled_four.any? {|word| word.start_with?("#{@word_one[3]}#{@word_two[3]}#{@word_three[3]}")}
    middle_square
    return ""
  end

  # word 3 down

  @shuffled_four.each do |word|
    word = word.split("")

    if word[0] == @word_one[3] && word[1] == @word_two[3] && word[2] == @word_three[3]
      @word_four[3] = word[3]
    end
  end


  unless @shuffled_five.any? {|word| word.start_with?("#{@word_four[0]}#{@word_four[1]}#{@word_four[2]}#{@word_four[3]}")}
    middle_square
    return ""
  end

  @shuffled_five.each do |word|
    word = word.split("")

    if word[0] == @word_four[0] && word[1] == @word_four[1] && word[2] == @word_four[2] && word[3] == @word_four[3]
      @word_four[4] = word[4]
    end
  end

  @y = Time.new
  puts @x - @y

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
  puts @board_reverse[4].join("")
  puts ""
end

  def bottom_left
    @shuffled_four.shuffle.each do |word|
      if word[3] == 'a'
        @word_one = word
      end
    end
    @word_two = @three_letter_words.sample
    @word_three = @three_letter_words.sample
    @word_one.chop!
    @board = [@word_one.split(""), @word_two.split(""), @word_three.split("")]

    @board_r = @board.transpose


    while true

      if @words.include?(@board_r[0].join("")) && @words.include?(@board_r[1].join("")) && @words.include?(@board_r[2].join(""))
        puts @board_r[0].join("")
        puts @board_r[1].join("")
        puts @board_r[2].join("")
        break
      end
        bottom_left
        return ""
    end
  end


middle_square

bottom_left
