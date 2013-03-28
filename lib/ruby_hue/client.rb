require "httparty"

module RubyHue
  class Client
    include HTTParty

    attr_reader :username

    def initialize(username)
      @username = username
    end

    def self.get_and_parse(*args)
      response = get(*args)
      MultiJson.load(response.body)
    end
  end
end