module Dictation
  class Teacher
    SLEEP_INTERVAL_WRITE_LETTER = 0.8
    SLEEP_INTERVAL_READ_LETTER = 0.1
    SLEEP_INTERVAL_GENERAL = 0.5

    def initialize(tts_dictate, tts_verify)
      @tts_dictate = tts_dictate
      @tts_verify = tts_verify
    end
    
    def dictates(words)
      words.each do |word|
        vocabulary = word.value
        @tts_dictate.speak(vocabulary)
        sleep(vocabulary.length * SLEEP_INTERVAL_WRITE_LETTER)
      end
    end
    
    def verifies(words)
      words.each do |word|
        @tts_dictate.speak(word.value)
        sleep(SLEEP_INTERVAL_GENERAL)
        word.orthography.each do |letter|
          @tts_dictate.speak(letter)
          sleep(SLEEP_INTERVAL_READ_LETTER)
        end
        sleep(SLEEP_INTERVAL_GENERAL)
        @tts_verify.speak(word.translation)
        puts word.value + '     ' + word.translation
        sleep(SLEEP_INTERVAL_GENERAL)
      end
    end
  end
end