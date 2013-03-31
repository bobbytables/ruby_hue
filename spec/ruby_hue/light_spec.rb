require "spec_helper"

describe RubyHue::Light do
  let(:id) { "1" }
  let(:bridge) { RubyHue::Bridge.new("192.168.100.1", "awesomeusername") }
  subject(:light) { described_class.new(id, bridge) }

  before do
    stub_request(:get, bridge.resource_url_for("lights/#{id}"))
      .to_return(body: fixture("light_1.json"))
  end

  describe "#initialize" do
    it "sets the ID" do
      instance = described_class.new(id, bridge)
      expect(instance.id).to eq(id)
    end

    it "sets the bridge" do
      instance = described_class.new(id, bridge)
      expect(instance.bridge).to be bridge
    end

    it "finds the state for the light" do
      instance = described_class.new(id, bridge)
      expect(instance.state).to be_kind_of Hash
    end
  end

  describe "#refresh_state!" do
    it "sets the state hash" do
      expect { light.refresh_state! }.to change { light.state.object_id }
    end
  end
end