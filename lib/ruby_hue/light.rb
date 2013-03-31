module RubyHue
  class Light
    attr_reader :id, :bridge

    def initialize(id, bridge)
      @id = id
      @bridge = bridge
    end

    def attributes
      @attributes ||= Client.get_and_parse bridge.resource_url_for("lights/#{id}")
    end

    def state
      Light::State.new(self, attributes["state"])
    end
  end
end