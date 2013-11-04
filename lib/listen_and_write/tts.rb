module ListenAndWrite
  class TTS
    def initialize(language, voice = nil)
      set_language_and_voice(language, voice)
    end
    
    def get_available_language_and_voice_pairs
      list_of_available_voices = `say -v '?'`.split("\n")
      languages_and_voices = list_of_available_voices.inject({}) do |collection, record|
        matched_results = record.match(/^(\w+).*?(\w{2})_/)
        available_language = matched_results[2].downcase.intern
        available_voice = matched_results[1]
        if collection.has_key?(available_language)
          collection[available_language] << available_voice
        else
          collection[available_language] = [available_voice]
        end
        collection
      end
    end
    
    def set_language_and_voice(language, voice)
      system_languages_and_voices = get_available_language_and_voice_pairs
      @language = language
      if system_languages_and_voices.keys.include?(@language)
        if voice
          if system_languages_and_voices[@language].include?(voice)
            @voice = voice
          else
            raise("No available voice found, please check if you have downloaded voice [#{voice}] in System Preferences -> Speech")
          end
        else
          @voice = system_languages_and_voices[@language].first
        end
      else
        raise("No available language found, please check if you have any voice for [#{language}] in System Preferences -> Speech")
      end
    end
    
    def speak(text)
      system("say -v #{@voice} #{text} > /dev/null 2>&1")
    end
    
    private :get_available_language_and_voice_pairs, :set_language_and_voice
  end
end