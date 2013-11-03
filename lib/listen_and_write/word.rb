# encoding: UTF-8

module ListenAndWrite
  class Word
    attr_accessor :value, :translation, :orthography
    
    def initialize(value, translation = nil)
      @value = value
      @translation = translation
      @orthography = decompose(value)
    end
    
    def decompose(word)
      word.split(//).map! do |x|
        normalize(x)
      end
    end
    
    def normalize(letter)
      case letter.downcase.chomp
      # German
      when 'ä'
        'ae'
      when 'ö'
        'oe'
      when 'ü'
        'ue'
      when 'ß'
        'ss'
      else
        letter
      end
    end
    
    private :decompose, :normalize
  end
end