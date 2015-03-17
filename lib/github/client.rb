require 'json'

module Github
  class Client

    def self.fetch username
      new.fetch username
    end

    def fetch username
      JSON.parse get username
    end

    private

    def get username
      conn     = Faraday.new(:url => "https://api.github.com")
      response = conn.get("/users/#{username}/events/public")
      response.body
    end
  end
end
