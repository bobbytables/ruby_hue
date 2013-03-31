module LightBridgeHelpers
  def light_with_bridge!(light_name=:light, bridge_name=:bridge)
    let(bridge_name) { RubyHue::Bridge.new("192.168.100.1", "awesomename") }
    let(light_name) { RubyHue::Light.new(1, send(bridge_name)) }
  end
end