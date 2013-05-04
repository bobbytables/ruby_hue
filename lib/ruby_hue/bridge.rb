module RubyHue
  class Bridge
    attr_reader :ip_address
    attr_accessor :username

    class << self
      def all
        Client.get_and_parse("http://www.meethue.com/api/nupnp").map do |bridge|
          self.new(bridge["internalipaddress"])
        end
      end
    end

    def initialize(ip_address, username=nil)
      @ip_address = ip_address
      @username = username
    end

    def resource_url_for(name)
      "http://#{ip_address}/api/#{username}/#{name}"
    end

    def lights
      Client.get_and_parse(resource_url_for("lights")).map do |id, light|
        RubyHue::Light.new(id, self)
      end
    end
  end
end