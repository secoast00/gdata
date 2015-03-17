require 'rails_helper'
require Rails.root.join('spec/support/network')

describe Event, type: :model do

  let(:events) { JSON.parse( File.read('spec/fixtures/secoast00.json'))}
  let(:actor) { Actor.new }

  describe ".create_from_record" do

    it "creates an event record" do
      Event.create_from_record actor, events[0]

      new_record = Event.first
      expect(Event.count).to eq 1
      expect(new_record.github_id).to eq "2601507853"
      expect(new_record.category).to eq "CreateEvent"
      expect(new_record.repo).to be nil
      expect(new_record.actor_id).to eq 1
    end

    it "saves the complete event retrieved in a data field" do
      expected = events[0].to_s

      Event.create_from_record actor, events[0]

      new_record = Event.first
      expect(new_record.data).to eq expected
    end

    context "given data already imported" do
      it "will not save the same events twice" do
        2.times do
          Event.create_from_record actor, events[0]
        end

        expect(Event.count).to eq 1
      end
    end

  end

  describe "#score" do

    it "event hash is formatted correctly" do
      {
        :CommitCommentEvent => 2,
        :IssueCommentEvent  => 2,
        :IssuesEvent        => 3,
        :WatchEvent         => 1,
        :PullRequestEvent   => 5,
        :PushEvent          => 7,
        :FollowEvent        => 1,
        :CreateEvent        => 3
      }.each do |category, score|
        e = Event.new :category => category
        expect(score).to eq e.score
      end

    end
    context "having events" do

      it "calculates a github score" do
        events.each do |record|
          Event.create_from_record actor, record
        end
        events = Event.where(:actor_id => 1)
        score  = events.map(&:score).reduce(:+)

        expect(actor.score).to eq score
      end
    end

    context "having no events" do
      it "returns 0" do
        event = Event.new

        expect(event.score).to eq 0
      end 
    end

  end
end
