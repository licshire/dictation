module Dictation
  class ControlCenter
    class << self
      def launch
        if OperatingSystem.supported?
          #valid_cmds = ['new', 'add', 'dictate', 'verify']
          command = ARGV[0]
          options = Commander.order(ARGV)
          case command
          #when valid_cmds[0]
          #  send("execute_#{valid_cmds[0]}")
          when 'new'
            execute_new(options)
          when 'add'
            execute_add(options)
          when 'dictate'
            execute_dictate(options)
          when 'verify'
            execute_verify(options)
          #else
            #cmds = valid_cmds.inject('') do |list, cmd|
            #  list += "#{cmd}, "
            #end
            #cmds.gsub!(/,\s$/, '')
            #puts 'Unknow command, only support #{valid_cmds.inspect}'
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
          regex = /dict_#{options[:language]}_.*\.txt/
          dictionary = nil
          Dir.glob("*").each do |file|
            (dictionary = file) && break if file.match(regex)
          end
          if dictionary
            words = Typewriter.new.collect
            Serializer.serialize(words, dictionary)
          else
            puts 'Can not find any dictionary file.'
          end
        else
          puts 'Please specify the target language.'
        end
      end

      def execute_dictate(options)

      end

      def execute_verify(options)

      end
    end

    private_class_method :new, :execute_new, :execute_add, :execute_dictate, :execute_verify
  end
end