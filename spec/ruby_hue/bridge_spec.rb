require "spec_helper"

describe RubyHue::Bridge do
  let(:ip) { "192.168.100.1" }
  let(:username) { "awesomeusername" }

  subject(:bridge) { described_class.new(ip, username) }

  describe "#initialize" do
    it "initializes with ip address" do
      instance = described_class.new(ip)
      expect(instance.ip_address).to eq ip
    end

    it "initializes with a username" do
      instance = described_class.new(ip, username)
      expect(instance.username).to eq username
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

  describe "#resource_url_for" do
    it "returns the url for a resource name" do
      expect(subject.resource_url_for("lights")).to eq("http://#{ip}/api/#{username}/lights")
    end
  end

  describe "#lights" do
    it "returns a light collection" do
      expect(bridge.lights).to be_kind_of RubyHue::LightsCollection
    end
  end
end