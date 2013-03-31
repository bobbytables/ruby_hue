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
    let(:instance) { described_class.new(id, bridge) }

    it "sets the ID" do
      expect(instance.id).to eq(id)
    end

    it "sets the bridge" do
      expect(instance.bridge).to be bridge
    end

    it "retrieves the light attributes" do
      expect(instance.attributes).to be_kind_of Hash
    end
  end

  describe "#state" do
    it "returns a Light::State object" do
      expect(subject.state).to be_kind_of RubyHue::Light::State
    end
  end
end