require "json"

module RubyHue
  class Light
    class State
      include BasicState
      attr_reader :light

      def initialize(light, state)
        @light = light
        @state = state
      end

      def save
        url = bridge.resource_url_for("lights/#{light.id}/state")
        body = JSON.generate updateable_state
        Client.put_and_parse(url, body: body)
      end

      def bridge
        light.bridge
      end
    end
  end
end