module Teresa
  module Parser
    class Generic
      def self.matches(regexp)
        define_singleton_method(:matches?) { |s| s =~ regexp }
      end

      def self.matches?(string)
        false
      end
    end
  end
end
