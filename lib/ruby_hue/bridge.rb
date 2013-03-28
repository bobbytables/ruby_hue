module RubyHue
  class Bridge
    attr_reader :ip_address

    def initialize(ip_address)
      @ip_address = ip_address
    end
  end
end