class AddPersonidToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :person_id, :integer

  end
end
