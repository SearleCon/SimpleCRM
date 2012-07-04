class AddUseridToPeople < ActiveRecord::Migration
  def change
    add_column :people, :userid, :integer

  end
end
