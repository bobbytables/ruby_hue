module RubyHue
  class LightsCollectionState
    include Light::BasicState

    attr_reader :collection

    def initialize(collection)
      @collection = collection
    end

    def bridge
      collection.bridge
    end

    def save
      collection.each do |light|
        url = bridge.resource_url_for("lights/#{light.id}/state")
        body = JSON.generate updateable_state
        Client.put_and_parse(url, body: body)
      end
    end
  end
end