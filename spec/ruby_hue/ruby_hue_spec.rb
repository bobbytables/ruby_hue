require "spec_helper"

describe RubyHue do
  describe ".configure" do
    it "returns a configuration object" do
      expect(RubyHue.configuration).to be_kind_of RubyHue::Configuration
    end
  end
end