require "spec_helper"

describe RubyHue::Light::State do
  light_with_bridge!
  subject { light.state }
  let(:state_hash) { {} }

  before do
    stub_request(:get, bridge.resource_url_for("lights/#{light.id}")).
      to_return(body: fixture("light_1.json"))
  end

  describe "#initialize" do
    let(:instance) { described_class.new(light, state_hash) }

    it "accepts a light argument" do
      expect(instance.light).to be light
    end

    it "accepts a state hash argument" do
      expect(instance.state).to be state_hash
    end
  end

  describe "#state" do
    it "returns a hash" do
      expect(subject.state).to be_kind_of Hash
    end
  end

  describe "getter methods" do
    let(:method_mapping) { method_mapping = described_class::MAPPING }

    it "responds to all keys available for a state" do
      method_mapping.each do |hue_key, ruby_hue_method|
        expect(subject.state).to have_key hue_key.to_s
        expect(subject).to respond_to ruby_hue_method
      end
    end

    it "returns the value for a state" do
      method_mapping.each do |hue_key, ruby_hue_method|
        expect(subject.send(ruby_hue_method)).to eq(subject.state[hue_key.to_s])
      end
    end
  end

  describe "#save" do
    let!(:state_request_stub) do
      stub_request(:put, bridge.resource_url_for("lights/#{light.id}/state")).to_return(body: "{}")
    end

    it "PUT's the state attributes for the light" do
      subject.save
      expect(state_request_stub).to have_been_requested
    end
  end

  describe "#updateable_state" do
    it "does not include immutable values" do
      described_class::IMMUTABLE_KEYS.each do |key|
        expect(subject.updateable_state.keys).not_to include key
      end
    end
  end
end