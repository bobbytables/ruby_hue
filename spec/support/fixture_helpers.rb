require "pathname"

module FixtureHelpers
  def fixture(filename)
    File.read(Pathname.pwd.join("spec", "fixtures", "responses", filename))
  end
end