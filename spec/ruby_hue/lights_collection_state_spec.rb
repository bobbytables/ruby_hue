require "spec_helper"

describe RubyHue::LightsCollectionState do
  let(:bridge) { RubyHue::Bridge.new("127.0.0.1", "username") }
  let(:light_collection) { RubyHue::LightsCollection.new(bridge) }
  subject { described_class.new(light_collection) }

  it_behaves_like "basic state"

  describe "#save" do
    let(:light) { double("light", id: 1) }
    let!(:state_request_stub) do
      stub_request(:put, bridge.resource_url_for("lights/#{light.id}/state")).to_return(body: "{}")
    end

    it "changes the state for all of the lights" do
      light_collection.stub(lights: [light])
      subject.on = true
      subject.save
      expect(state_request_stub).to have_been_requested
    end
  end
end