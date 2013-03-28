require "httparty"

module RubyHue
  class Client
    include HTTParty

    attr_reader :username

    def initialize(username)
      @username = username
    end
  end
end