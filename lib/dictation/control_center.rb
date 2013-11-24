module Dictation
  class ControlCenter
    class << self
      def launch
        if OperatingSystem.supported?
          command = ARGV[0]
          options = Commander.order(ARGV)
          case command
          when 'new'
            execute_new(options)
          when 'add'
            execute_add(options)
          when 'dictate'
            execute_dictate(options)
          when 'verify'
            execute_verify(options)
          end
        else
          puts 'Sorry, your Operating System is not supported.  Only Mac OSX has built-in TTS (Text-to-Speech).'
        end
      end

      def execute_new(options)
        if options[:dictate] && options[:verify]
          File.open("dict_#{options[:dictate]}_#{options[:verify]}.txt", "w") {}
        else
          puts 'Please give both dictate (-d) and verify (-v) languages.'
        end
      end

      def execute_add(options)
        if options[:language]
          dictionary = get_dictionary(options[:language])
          if dictionary
            words = Typewriter.new.collect
            Serializer.serialize(words, dictionary)
          else
            puts 'Can not find any dictionary file.'
          end
        else
          puts 'Please specify the target language (-l).'
        end
      end

      def execute_dictate(options)
        execute_speak(options, :dictates)
      end

      def execute_verify(options)
        execute_speak(options, :verifies)
      end

      def get_dictionary(language)
        dictionary = nil
        regex = /dict_#{language}_[a-z]{2}\.txt/
        Dir.glob("*").each do |file|
          (dictionary = file) && break if file.match(regex)
        end
        dictionary
      end

      def get_languages(dictionary)
        regex = /dict_([a-z]{2})_([a-z]{2})\.txt/
        md = dictionary.match(regex)
        [md[1], md[2]]
      end

      def get_words(options)
        words = []
        dictionary = nil
        language = options[:language]
        word_begin = options[:word_begin]
        word_end = options[:word_end]
        line_start = options[:line_start]
        line_finish = options[:line_finish]

        if language
          dictionary = get_dictionary(language)
        end

        if dictionary && (word_begin || line_start)
          if word_end
            words = Serializer.deserialize_a_portion_by_given_word(dictionary, word_begin, word_end)
          elsif line_finish
            words = Serializer.deserialize_a_portion_by_given_line(dictionary, line_start, line_finish)
          else
            words = (word_begin ? Serializer.deserialize_a_portion_by_given_word(dictionary, word_begin) : Serializer.deserialize_a_portion_by_given_line(dictionary, line_start))
          end
        else
          words = Serializer.deserialize(dictionary)
        end

        words
      end

      def set_teacher(dictionary)
        languages = get_languages(dictionary)
        tts_dictate = TTS.new(languages[0].intern)
        tts_verify = TTS.new(languages[1].intern)
        Teacher.new(tts_dictate, tts_verify)
      end

      def execute_speak(options, action)
        if options.has_key?(:language)
          words = get_words(options)
          dictionary = get_dictionary(options[:language])
          if dictionary
            teacher = set_teacher(dictionary)
            teacher.send(action, words)
          else
            puts 'Please check if the given language is correct (two-letters country code) or whether the dictionary file exists.'
          end
        else
          puts 'Please specify target learning language by two-letters country code (-l)'
        end
      end
    end

    private_class_method :new, :get_dictionary, :get_languages, :get_words, :set_teacher, :execute_speak, :execute_new, :execute_add, :execute_dictate, :execute_verify
  end
end