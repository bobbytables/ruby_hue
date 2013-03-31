require "httparty"

module RubyHue
  class Client
    include HTTParty

    def self.get_and_parse(*args)
      response = get(*args)
      MultiJson.load(response.body)
    end

    def self.put_and_parse(*args)
      response = put(*args)
      MultiJson.load(response.body)
    end
  end
end