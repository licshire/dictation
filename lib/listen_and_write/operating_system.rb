module ListenAndWrite
  class OperatingSystem
    TYPE = {
      lin:     'linux',
      mac:     'osx',
      win:     'windows',
      unknown: 'UNKNOWN'
    }
    
    SUPPORTED_TYPE = [TYPE[:mac]]
    
    class << self
      def match_os(regex)
        !!RUBY_PLATFORM.match(regex)
      end
      
      def is_linux?
        match_os(/linux/)
      end

      def is_mac?
        match_os(/darwin/)
      end

      def is_windows?
        match_os(/mswin|mingw|cygwin|bccwin|wince|emx/)
      end
      
      def what
        return TYPE[:lin] if is_linux?
        return TYPE[:mac] if is_mac?
        return TYPE[:win] if is_windows?
        return TYPE[:unknown]
      end
      
      def supported?
        SUPPORTED_TYPE.include?(what)
      end
    end
    
    private_class_method :new, :match_os, :is_linux?, :is_mac?, :is_windows?, :what
  end
end