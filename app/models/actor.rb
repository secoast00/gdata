require 'github/client'

class Actor < ActiveRecord::Base
  has_many :events

  def self.import name
    records = Github::Client.fetch name
    actor   = Actor.find_or_create_by(:name => name)

    records.each do |record|
      Event.create_from_record actor, record
    end
    actor
  end

  def score
    events.map(&:score).reduce(:+)
  end
end
