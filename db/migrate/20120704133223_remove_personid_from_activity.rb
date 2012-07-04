class RemovePersonidFromActivity < ActiveRecord::Migration
  def up
    remove_column :activities, :personid
      end

  def down
    add_column :activities, :personid, :integer
  end
end
