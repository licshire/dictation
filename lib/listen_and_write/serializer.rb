module ListenAndWrite
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
          words.push(JSON.parse(line))
        end
        words
      end
    end
  end
end