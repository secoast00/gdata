class Event < ActiveRecord::Base
  belongs_to :actor

  validates :github_id, :uniqueness => true

  SCORES =
      {
          :CommitCommentEvent => 2,
          :IssueCommentEvent  => 2,
          :IssuesEvent        => 3,
          :WatchEvent         => 1,
          :PullRequestEvent   => 5,
          :PushEvent          => 7,
          :FollowEvent        => 1,
          :CreateEvent        => 3
      }
  BASE64 = 'm'

  def self.create_from_record actor, record
    fields = {
        :github_id         => record["id"],
        :category          => record["type"],
        :actor             => actor,
        :data              => record.to_s,
        :github_created_at => record["created_at"]
    }
    create fields
  end

  def score
    SCORES.fetch(category) { 0 }
  end

end
