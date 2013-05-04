# RubyHue

RubyHue is a library to interact with Hue lights.

http://meethue.com/

## Installation

Add this line to your application's Gemfile:

    gem 'ruby_hue'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_hue

## Usage

RubyHue starts mostly at the Bridge class.

```ruby
bridge = RubyHue::Bridge.new("192.168.1.100", "yourbridgeusername")
```

To get all lights for the bridge:

```ruby
bridge = RubyHue::Bridge.new("192.168.1.100", "yourbridgeusername")
lights = bridge.lights

lights.state.on = true
lights.state.save # This will turn on all lights on the bridge
```

### Light Usage

RubyHue comes with a Light class that you initialize with an ID and Bridge instance. Most interactions will happen with an instance of this class.

```ruby
bridge = RubyHue::Bridge.new("192.168.1.100", "yourbridgeusername")
light = RubyHue::Light.new("1", bridge)
```

Now you're ready to ask for the current state of the light (on, brightness, hue, etc...)

```ruby
light = RubyHue::Light.new("1", bridge)
light.state.brightness
# => 50

light.state.brightness = 255
light.state.save
#=> [{"success"=>{"/lights/1/state/bri"=>255}}, ....
```

Here's the list of states you can change:

* `on` (true, false)
* `brightness` (0..255)
* `hue` (0..65535)
* `saturation` (0..255)
* `xy` See http://developers.meethue.com/coreconcepts.html#color_gets_more_complicated
* `color_temperature`
* `alert` ("none", "select", "lselect")
* `effect` ("none", "colorloop")


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
