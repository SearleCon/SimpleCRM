class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :shortname
      t.text :description
      t.date :targetdate
      t.boolean :active
      t.integer :userid

      t.timestamps
    end
  end
end
