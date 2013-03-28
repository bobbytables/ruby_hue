require "ruby_hue/version"
require "ruby_hue/client"
require "ruby_hue/configuration"
require "ruby_hue/light"
require "ruby_hue/bridge"

module RubyHue
  def self.configuration
    @configuration ||= Configuration.new
  end
end
