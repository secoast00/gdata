module Factory
  class << self
    def events_feed_json(name)
      File.read "spec/fixtures/#{name}.json"
    end
  end
end
