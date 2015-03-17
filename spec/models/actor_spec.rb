require 'rails_helper'
require 'github/client'

describe Actor, type: :model do

  describe ".import" do

    let(:secoast_json) { File.read 'spec/fixtures/secoast00.json' }
    let(:client )      { instance_double("client", :fetch => JSON.parse(secoast_json)) }

    before :each do
      allow(Github::Client).to receive(:new).and_return(client)
    end

    context "given a github username" do

      it "saves a single actor with the correct username" do
        Actor.import 'secoast00'

        actor = Actor.first
        expect(Actor.count).to eq 1
        expect(actor.name).to eq "secoast00"
      end

    end

    context "given a username already imported" do

      it "does not duplicate data" do
        Actor.import 'secoast00'
        Actor.import 'secoast00'

        expect(Actor.count).to eq 1
      end

    end

  end
end
