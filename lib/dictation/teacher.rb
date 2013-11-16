module Dictation
  class Teacher
    SLEEP_INTERVAL_WRITE_LETTER = 0.8
    SLEEP_INTERVAL_READ_LETTER = 0.1
    SLEEP_INTERVAL_GENERAL = 0.5
    
    def read_original_vocabulary(words, tts)
      words.each do |word|
        vocabulary = word.value
        tts.speak(vocabulary)
        sleep(vocabulary.length * SLEEP_INTERVAL_WRITE_LETTER)
      end
    end
    
    def reveal_answer(words, tts_orig, tts_annotation)
      words.each do |word|
        tts_orig.speak(word.value)
        sleep(SLEEP_INTERVAL_GENERAL)
        word.orthography.each do |letter|
          tts_orig.speak(letter)
          sleep(SLEEP_INTERVAL_READ_LETTER)
        end
        sleep(SLEEP_INTERVAL_GENERAL)
        tts_annotation.speak(word.translation)
        puts word.value + '     ' + word.translation
        sleep(SLEEP_INTERVAL_GENERAL)
      end
    end
  end
end