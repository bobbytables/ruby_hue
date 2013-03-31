require "spec_helper"

describe RubyHue::Model do
  describe "inclusion" do
    context "into a bare class" do
      subject do
        klass = Class.new { include RubyHue::Model }
        klass.new
      end

      specify "#model_name raises" do
        expect { subject.model_name }.to raise_exception(RubyHue::Model::IncompleteImplementation)
      end

      specify "#to_key raises" do
        expect { subject.to_key }.to raise_exception(RubyHue::Model::IncompleteImplementation)
      end

      specify "#persisted? returns false" do
        expect(subject).not_to be_persisted
      end

      specify "#resource_name raises" do
        expect { subject.resource_name }.to raise_exception(RubyHue::Model::IncompleteImplementation)
      end
    end
  end

  describe "complete implementation" do
    context "#"
  end
end