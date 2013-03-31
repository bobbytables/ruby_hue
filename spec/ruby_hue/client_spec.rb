require "spec_helper"

describe RubyHue::Client do
  describe ".put_and_parse" do
    let(:json) { '{"on": true}' }

    before do
      described_class.should_receive(:put).with("/", {}).and_return(json)
    end

    pending "loads the json response" do
      response = RubyHue::Client.put_and_parse("/", {})
      expect(response).to have_key "on"
      expect(response["on"]).to be_true
    end
  end
end