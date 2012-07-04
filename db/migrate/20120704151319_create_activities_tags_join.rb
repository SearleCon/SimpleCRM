class CreateActivitiesTagsJoin < ActiveRecord::Migration
  def self.up
    create_table :activities_tags, :id => false  do |t|
    t.integer :activity_id
    t.integer :tag_id
  end
end

def self.down
  drop_table :activities_tags
end
end
