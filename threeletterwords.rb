require 'pry'

@words = []
file = File.open("wordlist copy.txt")
file.each do |line|
  @words.push line.chomp
end
@letters = []
@words.each do |word|
  if word.length == 3
    @letters << word
  end
end


def find_words
@word_one = @letters.sample
@word_two = @letters.sample
@word_three = @letters.sample

@board = [@word_one.split(""), @word_two.split(""), @word_three.split("")]
@board_reverse = @board.transpose
end

count = 0
while true
find_words
count += 1

if @letters.include?(@board_reverse[0].join("")) && @letters.include?(@board_reverse[1].join("")) && @letters.include?(@board_reverse[2].join(""))

  puts @board_reverse[0].join("")
  puts @board_reverse[1].join("")
  puts @board_reverse[2].join("")

break
end
end
