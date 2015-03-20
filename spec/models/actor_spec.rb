require 'rails_helper'
require 'github/client'
require Rails.root.join('spec/support/factory')

describe Actor, type: :model do

  describe ".import" do

    let(:secoast_json) { Factory.events_feed_json("secoast00") }
    let(:client )      { instance_double("client", :fetch => JSON.parse(secoast_json)) }

    before :each do
      allow(Github::Client).to receive(:new).and_return(client)
    end

    context "given a github username" do

      it "saves a single actor" do
        Actor.import "secoast00"

        expect(Actor.count).to eq 1
      end

      it "has the correct name" do
        actor = Actor.import "secoast00"

        expect(actor.name).to eq "secoast00"
      end

      it "has related events" do
        actor = Actor.import "secoast00"

        expect(actor.events.count).to eq 7
      end

      it "has a calculated score" do
        Actor.import "secoast00"
        actor = Actor.find_by(:name => "secoast00")

        expect(actor.score).to eq 25
      end

    end

    context "given a username already imported" do

      it "does not duplicate data" do
        2.times do
          Actor.import 'secoast00'
        end

        expect(Actor.count).to eq 1
      end

    end

  end
end
