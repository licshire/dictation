module ListenAndWrite
  class Word
    attr_accessor :value, :translation
    
    def initialize(value, translation = nil)
      @value = value
      @translation = translation
    end
    
    def decompose
      @value.split(//)
    end
  end
end