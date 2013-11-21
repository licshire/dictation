module Dictation
  class Typewriter
    def record
      print 'Word:        '
      value = gets.chomp
      print 'Translation: '
      translation = gets.chomp
      Word.new(value, translation)
    end

    def collect
      puts 'Please type word and translation one by one.'
      # loop until user finishes
    end
  end
end