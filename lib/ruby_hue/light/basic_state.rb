module RubyHue
  class Light
    module BasicState
      MAPPING = {
        on: :on,
        bri: :brightness,
        hue: :hue,
        sat: :saturation,
        xy: :xy,
        ct: :color_temperature,
        alert: :alert,
        effect: :effect,
        colormode: :color_mode,
        reachable: :reachable
      }

      IMMUTABLE_KEYS = %w(colormode reachable)

      def updateable_state
        @state.reject do |key, value|
          IMMUTABLE_KEYS.include? key
        end
      end

      MAPPING.each do |hue_key, method_name|
        hue_key = hue_key.to_s
        define_method method_name do
          @state[hue_key]
        end

        unless IMMUTABLE_KEYS.include?(hue_key)
          define_method "#{method_name}=".to_sym do |new_value|
            @state[hue_key] = new_value
          end
        end
      end
    end
  end
end