class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :tagtype
      t.string :tagcolor
      t.integer :userid

      t.timestamps
    end
  end
end
