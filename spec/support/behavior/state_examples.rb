shared_examples_for "basic state" do
  describe "getter methods" do
    let(:method_mapping) { method_mapping = RubyHue::Light::BasicState::MAPPING }

    it "responds to all keys available for a state" do
      method_mapping.each do |hue_key, ruby_hue_method|
        expect(subject).to respond_to ruby_hue_method
      end
    end

    it "returns the value for a state" do
      method_mapping.each do |hue_key, ruby_hue_method|
        expect(subject.send(ruby_hue_method)).to eq(subject.state[hue_key.to_s])
      end
    end
  end

  describe "#updateable_state" do
    it "does not include immutable values" do
      RubyHue::Light::BasicState::IMMUTABLE_KEYS.each do |key|
        expect(subject.updateable_state.keys).not_to include key
      end
    end
  end
end