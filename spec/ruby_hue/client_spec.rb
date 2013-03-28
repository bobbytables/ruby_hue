require "spec_helper"

describe RubyHue::Client do
  describe "#initialize" do
    it "sets the username" do
      instance = described_class.new("username")
      expect(instance.username).to eq("username")
    end
  end
end