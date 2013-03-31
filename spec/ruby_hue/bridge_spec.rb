require "spec_helper"

describe RubyHue::Bridge do
  describe "#initialize" do
    it "initializes with ip address" do
      instance = described_class.new("192.168.100.1")
      expect(instance.ip_address).to eq "192.168.100.1"
    end
  end

  describe ".all" do
    before do
      stub_request(:get, "http://www.meethue.com/api/nupnp").to_return(body: fixture("bridges.json"))
    end

    it "returns all bridges" do
      expect(RubyHue::Bridge.all).to have(1).items
    end
  end

  describe "#lights" do
    it "returns all lights for the bridge"
  end
end