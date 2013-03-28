module RubyHue
  class Bridge
    attr_reader :ip_address

    class << self
      def all
        Client.get_and_parse("http://www.meethue.com/api/nupnp").map do |bridge|
          self.new(bridge["internalipaddress"])
        end
      end
    end

    def initialize(ip_address)
      @ip_address = ip_address
    end
  end
end