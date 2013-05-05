module RubyHue
  class LightsCollection
    attr_reader :bridge

    def initialize(bridge)
      @bridge = bridge
    end

    def lights
      Client.get_and_parse(bridge.resource_url_for("lights")).map do |id, light|
        RubyHue::Light.new(id, self)
      end
    end
  end
end