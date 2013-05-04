require "ruby_hue/version"

module RubyHue
  autoload :Client, "ruby_hue/client"
  autoload :Bridge, "ruby_hue/bridge"
  autoload :Model, "ruby_hue/model"
  autoload :Light, "ruby_hue/light"
  autoload :LightsCollection, "ruby_hue/lights_collection"
end

require "ruby_hue/light/basic_state"
require "ruby_hue/light/state"