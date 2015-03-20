require 'rails_helper'
require 'github/client'
require Rails.root.join('spec/support/network')
require Rails.root.join('spec/support/factory')

module Github

  describe Client do

    before :each do
      stub_github_feed "secoast00"
    end

    describe ".fetch" do
      context "given an existing username" do
        it "returns events from github accounts" do
          events = Client.fetch 'secoast00'

          expect(events.length).to eq 7
        end

        it "returned events contain the correct actor" do
          events = Client.fetch 'secoast00'

          expect(events[0]["actor"]["login"]).to eq "secoast00"
        end
      end

    end
  end

end
