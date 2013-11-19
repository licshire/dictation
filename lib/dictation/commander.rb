require 'optparse'

module Dictation
  class Commander
    def self.order(args)
      options = {}
      commands = {
          'new' => OptionParser.new do |opts|
            opts.on('-t TTS', '--test') do |tts|
              options[:test] = tts
            end

            opts.on('-v TTS', '--verification') do |tts|
              options[:verification] = tts
            end
          end,

          'test' => OptionParser.new do |opts|
            opts.on('-s LINE', '--start', Integer) do |line|
              options[:test_start] = line
            end

            opts.on('-e LINE', '--end', Integer) do |line|
              options[:test_end] = line
            end
          end,

          'verify' => OptionParser.new do |opts|
            opts.on('-s LINE', '--start', Integer) do |line|
              options[:verify_start] = line
            end

            opts.on('-e LINE', '--end', Integer) do |line|
              options[:verify_end] = line
            end
          end
      }
      commands[args.shift].order!
      options
    end

    private_class_method :new
  end
end