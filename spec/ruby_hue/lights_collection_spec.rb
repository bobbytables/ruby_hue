require "spec_helper"

describe RubyHue::LightsCollection do
  let(:bridge) { RubyHue::Bridge.new("127.0.0.1", "username") }
  subject { described_class.new(bridge) }

  describe "#initialize" do
    it "accepts a bridge" do
      expect { described_class.new(bridge) }.to_not raise_error
    end
  end

  describe "#lights" do
    before do
      stub_request(:get, bridge.resource_url_for("lights")).to_return(body: fixture("lights.json"))
    end

    it "returns 3 light objects" do
      expect(subject).to have(3).lights
    end
  end
end