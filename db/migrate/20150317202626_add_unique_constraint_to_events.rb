class AddUniqueConstraintToEvents < ActiveRecord::Migration
  def change
    add_index :events, :github_id, :unique => true
  end
end
