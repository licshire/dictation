module Dictation
  class Typewriter
    attr_accessor :words

    def initialize
      @words = []
    end

    def get_input_if_not_nil
      input = gets
      input.nil? ? nil : input.chomp!
    end

    def record
      paint_print('Word:         ', :blue)
      value = get_input_if_not_nil
      paint_print('Translation:  ', :yellow)
      translation = get_input_if_not_nil
      @words.push(Word.new(value, translation)) if value && translation
    end

    def collect
      paint_puts('Please type word and translation one by one, press Enter key to save.  When you finish, press Ctrl+C.', :pink)
      Signal.trap('SIGINT') do
        puts ''
        break
      end
      loop do
        record
      end
      paint_puts("=" * 80, :green)
      paint_puts("Input is done.", :green)
      @words
    end

    def paint(text, color)
      case color
        when :green
          color_code = 32
        when :yellow
          color_code = 33
        when :blue
          color_code = 34
        when :pink
          color_code = 35
        else
          color_code = 0
      end
      "\e[#{color_code}m#{text}\e[0m"
    end

    def paint_print(text, color)
      print(paint(text, color))
    end

    def paint_puts(text, color)
      puts(paint(text, color))
    end

    private :get_input_if_not_nil, :record, :paint, :paint_print, :paint_puts
  end
end