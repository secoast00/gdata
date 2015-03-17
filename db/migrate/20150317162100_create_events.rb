class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :github_id
      t.string :category
      t.references :actor, :index => true
      t.string :repo
      t.text :data
      t.datetime :github_created_at, :null => false
      t.timestamps
    end
  end
end
