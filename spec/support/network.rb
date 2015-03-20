require 'github/client'

  def stub_github_feed( username )
    client = Github::Client.new
    json = Factory.events_feed_json(username)

    allow(client).to receive(:get).and_return(json)
    allow(Github::Client).to receive(:new).and_return(client)
  end

