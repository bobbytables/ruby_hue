require "spec_helper"

describe RubyHue::Configuration do
  it "has a bridge_ip" do
    expect(subject).to respond_to :bridge_ip
    expect(subject).to respond_to :bridge_ip=
  end

  it "has a api_username" do
    expect(subject).to respond_to :api_username
    expect(subject).to respond_to :api_username=
  end
end