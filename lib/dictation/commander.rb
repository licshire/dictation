require 'optparse'

module Dictation
  class Commander
    class << self
      def order(args)
        options = {}
        commands = {
            'new' => OptionParser.new do |opts|
              opts.banner = set_banner('new')

              opts.on('-d', '--dictate TTS', 'Specify two-letters language code for dictation') do |tts|
                options[:dictate] = tts
              end

              opts.on('-v', '--verify TTS', 'Specify two-letters language code for verification') do |tts|
                options[:verify] = tts
              end
            end,

            'add' => OptionParser.new do |opts|
              opts.banner = set_banner('add')

              opts.on('-t', '--target LANGUAGE', 'Specify the target language file for adding more words') do |language|
                options[:language] = language
              end
            end,

            'dictate' => OptionParser.new do |opts|
              opts.banner = set_banner('dictate')

              opts.on('-b', '--begin WORD', 'Begin with given word') do |word|
                options[:dictate_begin] = word
              end

              opts.on('-e', '--end WORD', 'End with given word') do |word|
                options[:dictate_end] = word
              end

              opts.on('-s', '--start LINE', Integer, 'Start with given line') do |line|
                options[:dictate_start] = line
              end

              opts.on('-f', '--finish LINE', Integer, 'Finish with given line') do |line|
                options[:dictate_finish] = line
              end
            end,

            'verify' => OptionParser.new do |opts|
              opts.banner = set_banner('verify')

              opts.on('-b', '--begin WORD', 'Begin with given word') do |word|
                options[:verify_begin] = word
              end

              opts.on('-e', '--end WORD', 'End with given word') do |word|
                options[:verify_end] = word
              end

              opts.on('-s', '--start LINE', Integer, 'Start with given line') do |line|
                options[:verify_start] = line
              end

              opts.on('-f', '--finish LINE', Integer, 'Finish with given line') do |line|
                options[:verify_finish] = line
              end
            end
        }
        commands[args.shift].order!
        options
      end

      def get_caller_file_name
        caller[-1].match(/\S+\.rb/)
      end

      def set_banner(cmd)
        "Usage: #{get_caller_file_name} #{cmd} [options]"
      end
    end

    private_class_method :new, :get_caller_file_name, :set_banner
  end
end