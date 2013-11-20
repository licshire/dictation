require 'optparse'

module Dictation
  class Commander
    def self.order(args)
      options = {}
      commands = {
          'new' => OptionParser.new do |opts|
            opts.on('-d', '--dictate TTS') do |tts|
              options[:dictate] = tts
            end

            opts.on('-v', '--verify TTS') do |tts|
              options[:verify] = tts
            end
          end,

          'dictate' => OptionParser.new do |opts|
            opts.on('-b', '--begin WORD') do |word|
              options[:dictate_begin] = word
            end

            opts.on('-e', '--end WORD') do |word|
              options[:dictate_end] = word
            end

            opts.on('-s', '--start LINE', Integer) do |line|
              options[:dictate_start] = line
            end

            opts.on('-f', '--finish LINE', Integer) do |line|
              options[:dictate_finish] = line
            end
          end,

          'verify' => OptionParser.new do |opts|
            opts.on('-b', '--begin WORD') do |word|
              options[:verify_begin] = word
            end

            opts.on('-e', '--end WORD') do |word|
              options[:verify_end] = word
            end

            opts.on('-s', '--start LINE', Integer) do |line|
              options[:verify_start] = line
            end

            opts.on('-f', '--finish LINE', Integer) do |line|
              options[:verify_finish] = line
            end
          end
      }
      commands[args.shift].order!
      options
    end

    private_class_method :new
  end
end