require "ruby_hue/version"
require "ruby_hue/client"
require "ruby_hue/configuration"

module RubyHue
  def self.configuration
    @configuration ||= Configuration.new
  end
end
