module RubyHue
  class LightsCollection
    include Enumerable

    attr_reader :bridge

    def initialize(bridge)
      @bridge = bridge
    end

    def lights
      @lights ||= Client.get_and_parse(bridge.resource_url_for("lights")).map do |id, light|
        RubyHue::Light.new(id, bridge)
      end
    end

    def state
      @state ||= LightsCollectionState.new(self)
    end

    def each(&block)
      lights.each do |light|
        yield light
      end
    end
  end
end