require "spec_helper"

describe RubyHue::Bridge do
  describe "#initialize" do
    it "initializes with ip address" do
      instance = described_class.new("192.168.100.1")
      expect(instance.ip_address).to eq "192.168.100.1"
    end
  end

  describe ".all" do

  end
end