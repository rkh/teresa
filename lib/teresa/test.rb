module Teresa
  class Test
    attr_accessor :state, :name, :id, :time, :message, :output

    def initialize(options = {})
      @state = :passed
      options.each { |k,v| send("#{k}=", v) if respond_to? "#{k}=" }
    end

    def failed?
      state == :failed
    end

    def passed?
      state == :passed
    end

    def skipped?
      state == :skipped
    end

    def inspect
      "#<%p:%p>" % [self.class, name]
    end
  end
end