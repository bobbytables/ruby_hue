module RubyHue
  module Model
    IncompleteImplementation = Class.new(StandardError)

    def model_name
      raise IncompleteImplementation, "Please implement a #model_name method"
    end

    def to_key
      raise IncompleteImplementation, "Please implement a #to_key method"
    end

    def persisted?
      false
    end

    def resource_name
      raise IncompleteImplementation, "Please implement a #resource_name method"
    end
  end
end