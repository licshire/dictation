module Dictation
  class Serializer
    class << self
      def serialize(data, file)
        if Array === data
          data = data.inject('') do |chunk, word|
            chunk += word.to_json + "\n"
          end
        end
        File.open(file, 'a') { |f| f.write(data) }
      end
    
      def deserialize(file)
        words = []
        File.open(file).each do |line|
          word = JSON.load(line)
          words.push(word)
        end
        words
      end

      def deserialize_a_portion_by_given_word(file, start, stop = nil)
        all_words = deserialize(file)
        idx_start = all_words.index { |x| x.value == start }
        idx_stop = ( stop.nil? ? nil : all_words.index { |x| x.value == stop } )
        idx_stop = all_words.size if idx_stop.nil?
        if !idx_start.nil? && idx_start <= idx_stop
          return all_words[idx_start..idx_stop]
        end
      end

      def deserialize_a_portion_by_given_line(file, start, stop = nil)
        all_words = deserialize(file)
        unless stop.nil?
          if stop >= start && stop <= all_words.size
            return all_words[start-1..stop-1]
          end
        else
          if start <= all_words.size
            return all_words[start-1..-1]
          end
        end
      end
    end
  end
end