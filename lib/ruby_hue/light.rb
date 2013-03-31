module RubyHue
  class Light
    attr_reader :id, :bridge

    def initialize(id, bridge)
      @id = id
      @bridge = bridge

      refresh_state!
    end

    def state
      @state
    end

    def refresh_state!
      url = bridge.resource_url_for("lights/#{id}")
      light_attributes = Client.get_and_parse(url)
      @state = light_attributes["state"]
    end
  end
end