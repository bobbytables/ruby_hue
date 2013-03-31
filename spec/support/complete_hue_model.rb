class HueModel
  include RubyHue::Model

  def model_name
    "hue_model"
  end

  def to_key
    nil
  end

  def resource_name
    "hue_model"
  end
end